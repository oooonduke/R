fw <- function(x) 10 * sin(0.3 * x) * sin(1.3 * x^2) +  # ���郏�C���h�ȖړI�֐�
  1e-05 * x^4 + 0.2 * x + 80
plot(fw, -50, 50, n = 1000)  # �O���t�������Ă݂�Ɨl�q���悭�킩��
res <- optim(50, fw, method = "SANN", control = list(maxit = 20000,
                                                       temp = 20, parscale = 20))  # "SANN" �@�ő��i�K�œK��
res               # ���̌���