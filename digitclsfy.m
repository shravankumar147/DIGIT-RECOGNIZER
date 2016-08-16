% Preparing data
load('kaggle_DigitID.mat')

target = train(:,1);
Tfeatures = train(:,2:end);
%% 
load('digitIdentifier.mat')

% digitClassifier = fitcecoc(Tfeatures,target);
%% Testing
%% Resubstitution Error
Mdl = digitClassifier;
isLoss = resubLoss(Mdl)
%% Test on Whole
P = predict(digitClassifier,test);
%% 
n = 1:28000;
submission = [n' P];

csvwrite('submission.csv',submission)
type submission.csv