clc
clear all
close all
load NIR_Xtest.mat
load MDFCNN.mat
% MDFCNN.mat comes with a trained MDFCNN model and all the weights and biases for each layer.
% NIR_Xtest.mat comes with  the spectrum and the content information of a raw meal sample.
% We are sorry that we do not have permission to release all of the spectral and content data.

% Merge the test data
imagegaf_test=imageDatastore("GASF_test_sample_001.png");
imagecwt_test=imageDatastore("CWT_est_sample_001.png");
NIRTestdata=arrayDatastore(NIR_Xtest);
combined_test=combine(imagegaf_test, imagecwt_test,NIRTestdata);

% Use MDFCNN to predict content of CaO, SiO2, Al2O3, and Fe2O3.
yfit_Test_cnn= (double(predict(Net,combined_test))).*stdtest+meantest; % rescale data
