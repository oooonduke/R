#https://school.js88.com/sd_article/dai/dai_center_data/pdf/2006Math2B.pdf
#--------------------------------------------------------
#�f�[�^�t���[���쐬
x <- c(3,4,5,4,4)
y <- c(7,9,10,8,6)
( seito    <- data.frame(X=x, Y=y) )

variance <- function(x) var(x)*(length(x)-1)/length(x)   # �W�{���U�����߂�֐����`
print(paste("x�̕W�{���U��", variance(x)))
print(paste("y�̕��ς�", mean(y)))
print(paste("y�̕W�{���U��", variance(y)))
wk <- cor(x, y, method="spearman")          # �P�Ȃ鑊�֌W��
print(paste("x,y�̑��֌W���̓���", wk^2))
#�f�[�^�i�t���[���j���̂��̂ɕύX�Ȃ��̂ŕϗʂ��ǂ����˂���񂵂Ă����֌W���͕ύX����킯���Ȃ��B�󌱐������̂Ђ��������B