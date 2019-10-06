#https://school.js88.com/sd_article/dai/dai_center_data/pdf/2006Math2B.pdf
#--------------------------------------------------------
#データフレーム作成
x <- c(3,4,5,4,4)
y <- c(7,9,10,8,6)
( seito    <- data.frame(X=x, Y=y) )

variance <- function(x) var(x)*(length(x)-1)/length(x)   # 標本分散を求める関数を定義
print(paste("xの標本分散は", variance(x)))
print(paste("yの平均は", mean(y)))
print(paste("yの標本分散は", variance(y)))
wk <- cor(x, y, method="spearman")          # 単なる相関係数
print(paste("x,yの相関係数の二乗は", wk^2))
#データ（フレーム）そのものに変更ないので変量をどうこねくり回しても相関係数は変更するわけがない。受験生向けのひっかけか。