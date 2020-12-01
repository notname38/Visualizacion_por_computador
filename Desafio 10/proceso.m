
    X   %contiene los datos
    Y   % contiene las etiquetas
     
       cv = cvpartition(Y,'KFold',10,'Stratify',true);
       for i=1:10


       	
           Xtrain=X(training(cv,i),:);
           Xtest=X(test(cv,i),:);
           Ytrain=Y(training(cv,i));
           Ytest=Y(test(cv,i));
           
           %llamada a la función que realiza el entrenamiento y evalua
           % la accuracy sobre el test.
           
       end
     




