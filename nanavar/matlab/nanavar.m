
function [sig,sig2,tau,sig2CI]=nanavar(y,tau0)
%% NaN allan Variance Matlab Code

% This Allan variance estimator can take into account NaN. The estimator 
% precision is affected when the number of NaN increases (see examples).
% 
% Inputs:
% y: Signal with a regularly spaced x-axis.
% tau0: Regular sampling period of the y signal
%
% Outputs
% tau: measurement time (same unit than tau0).
% sig: N samples standard deviation.
% sig2: Normal Allan standard deviation, 2 samples standard deviation.
% sig2I: Confidence interval of the normal Allan standard Deviation.

x=[];
n=length(y);
jj=floor(  log((n-1))/log(2) );
f = waitbar(0,'Please wait...');
for j=0:jj-1
    waitbar(2^j/2^(jj-1),f,['Computing AVAR ' num2str(floor(2^j/2^(jj-1)*100)) '%'])
    m=2^j;
    tau(j+1)=m*tau0;
    D=zeros(1,n-m+1);
    for i=1:n-m+1
        D(i)=nansum(y(i:i+m-1))/m;
    end
    %N samples
    sig(j+1)=nanstd(D(1:m:n-m+1));
    %AVAR
    n_ok = find(~isnan(D));
    if isempty(n_ok)
        sig2(j+1) = NaN;
    else
        sy = sum(diff(D(1:m:n-m+1)).^2);
        Nk = length(n_ok);
        sig2(j+1) = sqrt(tau(j+1)/2/tau0/Nk*sy);
        sig2CI(j+1) = sqrt(quantile(diff(D(1:m:n-m+1)).^2,0.05)*tau(j+1)/2/tau0/Nk);
    end
    
end
close(f)
end