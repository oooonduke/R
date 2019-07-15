#fw <- function(x) 10 * sin(0.3 * x) * sin(1.3 * x^2) + 1e-05 * x^4 + 0.2 * x + 80  # ���郏�C���h�ȖړI�֐�

#myfunc <- function(x,y) {35000 * x + 15000 * y}
#sines  <- outer(1:25, 1:25, myfunc)
#matplot(sines, pch = 1:100, type = "o")

fw <- function(x,y) {35 * x + 16 * y}
sines  <- outer(1:50, 1:50, fw)
matplot(sines, pch = 1:100, type = "o")

#res <- optim(50, fw, method = "SANN", control = list(maxit = 20000,temp = 20, parscale = 20))  # "SANN" �@�ő��i�K�œK��
#res               # ���̌���


N <- 2000  #�J�[�g���䐔
x <- seq(0, 50, by = 1)
y <- seq(0, 50, by = 1)
#fw <- function(x,y) {35 * x + 16 * y >= N}
fw <- function(x) {35 * x >= N}
#res <- optim(c(0,0), fw , method = "SANN", control = list(maxit = 20000,temp = 20, parscale = 20))  # "SANN" �@�ő��i�K�œK��
res <- optim(0, fw , method = "SANN", control = list(maxit = 20000,temp = 20, parscale = 2500))  # "SANN" �@�ő��i�K�œK��
res               # ���̌���

