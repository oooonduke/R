library(CVXR)
x <- Variable(5, name="x") # 変数の宣言

constraints <- list() # 目的変数の定義
constraints <- c(constraints, x > 0) # 非負制約
constraints <- c(constraints, sum(x) == 72000) # 合計金額
constraints <- c(constraints, x[1] == 20000) # ふとっぱら！！

obj1 <- Minimize(0) # 問題関数の定義
o1 <- Problem(obj1, constraints) # 問題と制約条件をまとめて。。。
result <- solve(o1) # Solverで問題を解く

print(result$status)
print(result$value) # 目的関数の値を確認 ここでは目的関数は0の定数なので0が得られるはず
print(result$getValue(x))