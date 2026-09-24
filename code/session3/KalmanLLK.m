% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
function [llk] = KalmanLLK(theta,Y,x0,Esig0,~,R,F,G,H)

% Estimating the innovation variance.
Q = theta(1);
if ~isfinite(Q) || Q <= 0
    llk = Inf;
    return
end

% apply the kalman filter
[~, Omega, S] = KF(Y,x0,Esig0,Q,R,F,G,H);
T=size(Y,2);

% Return the negative Gaussian log likelihood for minimization.
if any(~isfinite(Omega)) || any(Omega <= 0)
    llk = Inf;
    return
end
llk = 0.5*(T*log(2*pi) + sum(log(Omega) + (S.^2)./Omega));
