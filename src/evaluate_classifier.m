function [ precision, nmat ] = evaluate_classifier( classifier, testing_images, testing_labels )
%EVALUATE_CLASSIFIER Summary of this function goes here
%   Detailed explanation goes here
pred_labels = classifier.predict(testing_images);

nmat = zeros(10,10);
s = size(testing_images);
tests = s(1);

for i = 1:s(1)
    nmat(testing_labels(i)+1, pred_labels(i)+1) = nmat(testing_labels(i)+1, pred_labels(i)+1) + 1;
end

precision = trace(nmat) / tests;

nvec = sum(nmat, 2);

for i = 1:10
    nmat(i,:) = nmat(i,:) / nvec(i);
end

end

