#http://www.okadajp.org/RWiki/?Rで数理計画#h57b4eda
#目的関数
#x1 + 9x2 + 3 x3
#上の式の最大化
#制約式
#x1 + 2 x2 + 3 x3  <= 9
#3 x1 + 2 x2 + 2 x3 <= 15
#--------------------------------------------------------
library(lpSolve)
f.obj <- c(1, 9, 3) 
f.con <- matrix (c(1, 2, 3, 3, 2, 2), nrow=2, byrow=TRUE)
f.dir <- c("<=", "<=")
f.rhs <- c(9, 15)
lp ("max", f.obj, f.con, f.dir, f.rhs, int.vec=1:3)
lp ("max", f.obj, f.con, f.dir, f.rhs)$solution

