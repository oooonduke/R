#http://jundoll.hatenablog.com/entry/2014/07/12/174333
# �萔��`
N <- 1000  #�J�[�g���䐔
A <- 35000 #10t�ԗb�Ԕ�p
B <- 20000 #4t�ԗb�Ԕ�p
# �ړI�֐�
fr <- function(x) {
#    return(35*x[1] + 16*x[2])  #�J�[�g������������^�s�񐔂����߂�֐�
     return(A*x[1] + B*x[2])    #�b�Ԕ�p�����߂�֐�
}

# �����������1
#10t�Ԃɂ�35��A4t�Ԃɂ�16��l�܂���̂Ƃ���B����ȊO�̑�t�Ԃ͍l�����Ȃ��B
(ui <- matrix(c(-35, -16, 1, 0, 0, 1), nc=2, byrow=TRUE))

# �����������2
(ci <- c( -N, 0, 0))

# ���s�i Nelder-Mead�@ �j
# constrOptim(theta=�����l, f=�ړI�֐�, grad=f�̃O���f�B�G���g�֐�, ui, ci, control=optim()�֓n���p�����[�^)
#res <- constrOptim(c(1, 1), fr, grad=NULL, ui=ui, ci=ci,control=list(fnscale=-1))
res <- constrOptim(c(1, 1), fr, grad=NULL, ui=ui, ci=ci)
res          # ���̌���
print(res$par)
#length(res$par)
a <- res$par[[1]]  #optim�֐��̌��ʂ̓��X�g
b <- res$par[[length(res$par)]]  #optim�֐��̌��ʂ̓��X�g

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


