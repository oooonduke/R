#http://www.okadajp.org/RWiki/?Rで数理計画#h57b4eda

# 定数定義
N <- 1000  #カートラ台数
A <- 35000 #10t車傭車費用
B <- 20000 #4t車傭車費用
C <- 15    #4t店舗の数
# 目的関数
#A*x1 + B*x2    #傭車費用を求める関数
#上の式の最小化

#制約式
#10t車には35台、4t車には16台詰まるものとする。それ以外の増t車は考慮しない。
#35*x1 + 16*x2 >= N #カートラを消化する運行回数を求める制約不等式
#0x1 + x2 > C  #X1かつX2は正の数かつx2分だけ4t車が必要
#--------------------------------------------------------
library(lpSolve)
f.obj <- c(A, B) 
f.con <- matrix (c(35, 16, 0, 1), nrow=2, byrow=TRUE)
f.dir <- c(">=", ">")
f.rhs <- c(N, C)
lp ("min", f.obj, f.con, f.dir, f.rhs, int.vec=1:2)
lp ("min", f.obj, f.con, f.dir, f.rhs)$solution

wk1 <- as.integer(round(as.numeric(as.character(lp ("min", f.obj, f.con, f.dir, f.rhs)$solution[[1]]))))
wk2 <- as.integer(round(as.numeric(as.character(lp ("min", f.obj, f.con, f.dir, f.rhs)$solution[[length(lp ("min", f.obj, f.con, f.dir, f.rhs)$solution)]]))))

if (wk1 > 0) {
  wk1 <- wk1 + 0.5
}

if (wk2 > 0) {
  wk2 <- wk2 + 0.5
}
print(as.integer(as.numeric(wk1)))
print(as.integer(as.numeric(wk2)))
print(as.integer(as.numeric(A*wk1)) + as.integer(as.numeric(B*wk2)))
