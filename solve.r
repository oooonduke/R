library(CVXR)
x <- Variable(5, name="x") # �ϐ��̐錾

constraints <- list() # �ړI�ϐ��̒�`
constraints <- c(constraints, x > 0) # �񕉐���
constraints <- c(constraints, sum(x) == 72000) # ���v���z
constraints <- c(constraints, x[1] == 20000) # �ӂƂ��ς�I�I

obj1 <- Minimize(0) # ���֐��̒�`
o1 <- Problem(obj1, constraints) # ���Ɛ���������܂Ƃ߂āB�B�B
result <- solve(o1) # Solver�Ŗ�������

print(result$status)
print(result$value) # �ړI�֐��̒l���m�F �����ł͖ړI�֐���0�̒萔�Ȃ̂�0��������͂�
print(result$getValue(x))