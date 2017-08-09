data("iris")

head(iris)

ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.67, 0.33))
table(ind)

iris_train <- iris[ind==1, 1:4]
iris_test <- iris[ind==2, 1:4]
iris_train_labels <- iris[ind==1, 5]
iris_test_labels <- iris[ind==2, 5]

library(class)
iris_test_pred<-knn(train=iris_train, test=iris_test,cl=iris_train_labels,k=3)

library(gmodels)
CrossTable(x=iris_test_labels, y=iris_test_pred, prop.chisq = FALSE)
