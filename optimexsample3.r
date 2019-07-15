#http://jundoll.hatenablog.com/entry/2014/07/12/174333
# 定数定義
N <- 1000  #カートラ台数
A <- 35000 #10t車傭車費用
B <- 20000 #4t車傭車費用
# 目的関数
fr <- function(x) {
#    return(35*x[1] + 16*x[2])  #カートラを消化する運行回数を求める関数
     return(A*x[1] + B*x[2])    #傭車費用を求める関数
}

# 制約条件その1
#10t車には35台、4t車には16台詰まるものとする。それ以外の増t車は考慮しない。
(ui <- matrix(c(-35, -16, 1, 0, 0, 1), nc=2, byrow=TRUE))

# 制約条件その2
(ci <- c( -N, 0, 0))

# 実行（ Nelder-Mead法 ）
# constrOptim(theta=初期値, f=目的関数, grad=fのグラディエント関数, ui, ci, control=optim()へ渡すパラメータ)
#res <- constrOptim(c(1, 1), fr, grad=NULL, ui=ui, ci=ci,control=list(fnscale=-1))
res <- constrOptim(c(1, 1), fr, grad=NULL, ui=ui, ci=ci)
res          # その結果
print(res$par)
#length(res$par)
a <- res$par[[1]]  #optim関数の結果はリスト
b <- res$par[[length(res$par)]]  #optim関数の結果はリスト

print(a)
print(b)

wk1 <- as.integer(round(as.numeric(as.character(a))))
wk2 <- as.integer(round(as.numeric(as.character(b))))

if (wk1 > 0) {
   a <- a + 0.5
}

if (wk2 > 0) {
   b <- b + 0.5
}

wk3 <- as.integer(round(as.numeric(as.character(a))))
wk4 <- as.integer(round(as.numeric(as.character(b))))

print(wk3)
print(wk4)
print(as.integer(as.numeric(A*wk3)) + as.integer(as.numeric(B*wk4)))


