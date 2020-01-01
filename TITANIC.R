#保存変数
ORIGINAL <- "//home//USER//titanic//train.csv"
TEST <- "//home//USER//titanic//test.csv"

# 学習用データの読み込み
#titanic_original <- read.csv("train.csv", stringsAsFactors=F, na.strings=(c("NA", "")))
titanic_original <- read.csv(ORIGINAL, stringsAsFactors=F, na.strings=(c("NA", "")))
# 学習用データの要約
apply(is.na(titanic_original), 2, sum)

# PassengerID、Ticket、Cabinの除外
titanic_omit_vari <- titanic_original[,c(2,3,5:8,10,12)]
# 変数の表示
names(titanic_omit_vari)

# NAを除外
titanic_na_omit <- na.omit(titanic_omit_vari)

# SEX（性別）の置き換え
# female:0,male:1
titanic_na_omit[,3] <- ifelse(titanic_na_omit[,3]=="female",0,1)
# Embarked（乗船した港）の置き換え
# C:0,Q:1,S:2
titanic_na_omit[,8] <- ifelse(titanic_na_omit[,8]=="C",0,ifelse(titanic_na_omit[,8]=="Q",1,2))

cor(titanic_na_omit)

# データをattach
attach(titanic_na_omit)
# ロジスティック回帰モデル作成
glm_result <- glm(Survived~., family="binomial", data=titanic_na_omit)
# 回帰係数の確認
summary(glm_result)

# 変数を絞ってロジスティック回帰モデル作成
glm_result <- glm(Survived~Pclass+Sex+Age+SibSp, family="binomial", data=titanic_na_omit)
# 回帰係数の確認
summary(glm_result)

# テストデータの読み込み
#titanic_test <- read.csv("test.csv", stringsAsFactors=F, na.strings=(c("NA", "")))
titanic_test <- read.csv(TEST, stringsAsFactors=F, na.strings=(c("NA", "")))


# 学習モデルにおけるAgeのmedianを計算
#median(na.omit(titanic_original$Age))
#ここでは算術平均を採用
dainyu <- floor(mean(na.omit(titanic_original$Age), na.rm = TRUE))
# テストデータのAgeの欠損値を補完
#titanic_test$Age <- ifelse(is.na(titanic_test$Age),28,titanic_test$Age)
titanic_test$Age <- ifelse(is.na(titanic_test$Age),dainyu,titanic_test$Age)

# Sex（性別）の置き換え
# female:0,male:1
titanic_test$Sex <- ifelse(titanic_test$Sex=="female",0,1)


# 予測モデルをテストデータにあてはめ
# 生存確率0.5以上なら生存:1、それ以外は死亡:0
test_result <- ifelse(predict(glm_result,newdata=titanic_test,type="response")>=0.5,1,0)
# PassengerId（乗客ID）を予測結果に列結合
output <- cbind(titanic_test$PassengerId,test_result)
# 先頭から数行を確認
head(output)
