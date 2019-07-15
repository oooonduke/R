fw <- function(x) 10 * sin(0.3 * x) * sin(1.3 * x^2) +  # あるワイルドな目的関数
  1e-05 * x^4 + 0.2 * x + 80
plot(fw, -50, 50, n = 1000)  # グラフを書いてみると様子がよくわかる
res <- optim(50, fw, method = "SANN", control = list(maxit = 20000,
                                                       temp = 20, parscale = 20))  # "SANN" 法で第一段階最適化
res               # その結果