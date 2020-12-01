rng('default');
load('attfaces.mat');

k=0; Y=zeros(40,1);
for i=1:10
for j=1:40
    k=k+1; Y(k)=j;
end
end

X=double(XX');

[coeff,scores] = pca(X);
X = scores; % Se utilizan todas las features

cross_val_scores = zeros(3,10); % LDA, Gaussian NB y Fine Tree
conf_matrix = zeros(3,40,40);

cv = cvpartition( ,'KFold',10,'Stratify',true);
for i=1:10
   Xtrain=X(training(cv,i),:);
   Xtest=X(test(cv,i),:);

   Ytrain=Y(training(cv,i));
   Ytest=Y(test(cv,i));

   lda = fitcdiscr(Xtrain,Ytrain); % https://es.mathworks.com/help/stats/discriminant-analysis.html?s_tid=srchtitle
   nb = fitcnb(Xtrain,Ytrain); % https://es.mathworks.com/help/stats/fitcnb.html
   tree = fitctree(Xtrain,Ytrain); % https://es.mathworks.com/help/stats/fitctree.html
   
   prediction_lda = predict(lda,Xtest);
   prediction_nb = predict(nb,Xtest);
   prediction_tree = predict(tree,Xtest);
   
   cross_val_scores(1,i) = sum(Ytest == prediction_lda) / size(Ytest,1);
   cross_val_scores(2,i) = sum(Ytest == prediction_nb) / size(Ytest,1);
   cross_val_scores(3,i) = sum(Ytest == prediction_tree) / size(Ytest,1);
   
   conf_matrix(1,:,:) = reshape(conf_matrix(1,:,:),[40,40]) + confusionmat(Ytest,prediction_lda);
   conf_matrix(2,:,:) = reshape(conf_matrix(2,:,:),[40,40]) + confusionmat(Ytest,prediction_nb);
   conf_matrix(3,:,:) = reshape(conf_matrix(3,:,:),[40,40]) + confusionmat(Ytest,prediction_tree);
end

acc_total_lda = sum(cross_val_scores(1,:))/10;
acc_total_nb = sum(cross_val_scores(2,:))/10;
acc_total_tree = sum(cross_val_scores(3,:))/10;

% https://es.mathworks.com/help/stats/confusionchart.html
figure;
cm = confusionchart(reshape(conf_matrix(1,:,:),[40,40]));
cm.Title = "LDA Acc: " + acc_total_lda*100 + "%";

figure;
cm = confusionchart(reshape(conf_matrix(2,:,:),[40,40]));
cm.Title = "Gaussian Naive Bayes Acc: " + acc_total_nb*100 + "%";

figure;
cm = confusionchart(reshape(conf_matrix(3,:,:),[40,40]));
cm.Title = "Tree Acc: " + acc_total_tree*100 + "%";



