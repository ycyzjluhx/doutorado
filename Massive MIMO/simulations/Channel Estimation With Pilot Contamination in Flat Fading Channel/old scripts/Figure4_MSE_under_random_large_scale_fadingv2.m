clear all;close all;clc

rng(1)

SNR = -10:4:18;     % Signal-to-noise ratio in dB.
linear_SNR = 10.^(SNR./10);

M = 30;             % Number of antennas.
K = 10;             % Number of single-antenna users.
L = 7;              % Number of cells.

N = K;              % Pilot length is set according to K and P.

q = linear_SNR; %linear_SNR/(N*(1 + a*(L-1)));  % Uplink pilot power.

cellRadius = 1000;
cellHole = 100;
sshadow = 8;
gamma = 3.8;

NUM_ITER = 10000;

% Generate pilot signals.
S = generatePilotMatrixFFT(N,K);

theoretical_ls_error = zeros(1,length(q));
theoretical_mmse_error = zeros(1,length(q));
theoretical_proposed_error = zeros(1,length(q));
theoretical_proposed_approx_error = zeros(1,length(q));
ls_error_vec = zeros(1,length(q));
mmse_error_vec = zeros(1,length(q));
prop_error_vec = zeros(1,length(q));
for q_idx=1:1:length(q)
    
    for numIter = 1:1:NUM_ITER
        
        % Generate Beta (large scale coefficients).
        beta = GenerateRandomBetav4(L,K,cellRadius,cellHole,sshadow,gamma);
        
        sum_G = zeros(M,N);
        Gil = zeros(M,K,L);
        for l=1:1:L
            
            % Generate channels.
            betaMatrix = diag(sqrt(beta(l,:)));
            Gil(:,:,l) = (1/sqrt(2))*complex(randn(M,K),randn(M,K))*betaMatrix;
            
            % Summation of all channels.
            sum_G = sum_G + Gil(:,:,l)*(S');
            
        end
        
        % Apply squared pilot power.
        sum_G = sqrt(q(q_idx))*sum_G;
        
        % Generate noise.
        W1 = (1/sqrt(2))*complex(randn(M,N),randn(M,N));
        
        % received pilot symbols at BS.
        Y1 = sum_G + W1;
        
        %-------------- Channel Estimation --------------
        
        % Summation of betas.
        [beta_sum, beta111] = getBetaSum(beta, 1, L);
        
        % Factor.
        epsilon11 = (beta_sum + 1/(q(q_idx)*N));
        
        % ******* LS ********
        Z11_ls = (1/(sqrt(q(q_idx))*N))*Y1*S(:,1);
        ls_error_vec(q_idx) = ls_error_vec(q_idx) + ((Z11_ls'-Gil(:,1,1)')*(Z11_ls-Gil(:,1,1)));
        
        % Least Squares (LS) Theoretical error.
        theoretical_ls_error(q_idx) = theoretical_ls_error(q_idx) + (epsilon11 - beta111);
        
        % ******* MMSE ********
        Z11_mmse = (beta111/epsilon11)*Z11_ls;
        mmse_error_vec(q_idx) = mmse_error_vec(q_idx) + ((Z11_mmse'-Gil(:,1,1)')*(Z11_mmse-Gil(:,1,1)));
        
        % Minimum Mean Squared Error (MMSE) Theoretical error.
        theoretical_mmse_error(q_idx) = theoretical_mmse_error(q_idx) + ((beta111/epsilon11) * (epsilon11 - beta111));
        
        % ******* Prop. ********
        Z11_prop = M*beta111*Z11_ls/((Z11_ls')*(Z11_ls));
        prop_error_vec(q_idx) = prop_error_vec(q_idx) + ((Z11_prop'-Gil(:,1,1)')*(Z11_prop-Gil(:,1,1)));
        
        % Proposed estimator Analytical error.
        theta_ik = calculateTheta_ikv2(beta111, epsilon11, M);
        theoretical_proposed_error(q_idx) = theoretical_proposed_error(q_idx) + (((M/(M-1))*((beta111^2)/epsilon11)) + beta111 - 2*beta111*theta_ik);        
        
        % Proposed estimator Approximated error.
        theoretical_proposed_approx_error(q_idx) = theoretical_proposed_approx_error(q_idx) + ((beta111*((((2-M)*beta111)/((M-1)*epsilon11)) + 1)));
    end
    
    fprintf('SNR: %d\n',SNR(q_idx));
    
    % Least Squares (LS) Simulation Error. (Monte Carlo)
    ls_error_vec(q_idx) = ls_error_vec(q_idx)./(M * NUM_ITER);
    % Least Squares (LS) Analytical Error.
    theoretical_ls_error(q_idx) = theoretical_ls_error(q_idx)./NUM_ITER;
    
    % Minimum Mean Squared Error (MMSE) Simulation Error. (Monte Carlo)
    mmse_error_vec(q_idx) = mmse_error_vec(q_idx)./(M * NUM_ITER);
    % Minimum Mean Squared Error (MMSE) Analytical Error.
    theoretical_mmse_error(q_idx) = theoretical_mmse_error(q_idx)./NUM_ITER;
    
    % Proposed estimator Simulation Error (Monte Carlo)
    prop_error_vec(q_idx) = prop_error_vec(q_idx)./(M * NUM_ITER);
    
    % Proposed estimator Analytical error.
    theoretical_proposed_error(q_idx) = theoretical_proposed_error(q_idx)./NUM_ITER;
    
    % Proposed estimator Approximated Error
    theoretical_proposed_approx_error(q_idx) = theoretical_proposed_approx_error(q_idx)./NUM_ITER;
end

fontSize = 10;

fdee_figure = figure;
semilogy(SNR,theoretical_mmse_error,'--r');
hold on;
semilogy(SNR,real(mmse_error_vec),'r*','MarkerSize',7);
semilogy(SNR,theoretical_ls_error,'--b','MarkerSize',7);
semilogy(SNR,real(ls_error_vec),'b*','MarkerSize',7);
semilogy(SNR,real(theoretical_proposed_error),'--k','MarkerSize',7);
semilogy(SNR,real(prop_error_vec),'k*','MarkerSize',7);
semilogy(SNR,real(theoretical_proposed_approx_error),'ko','MarkerSize',7);
hold off
grid on;
xlabel('SNR [dB]')
ylabel('avg. MSE')
legend('MMSE (ana)','MMSE (sim)','LS (ana)', 'LS (sim)', 'Prop. (ana)', 'Prop. (sim)', 'Prop. (approx.)');
%axis([SNR(1) SNR(length(SNR)) 0.18 5.1])
strText = sprintf('M = %d',M);
x1 = SNR(length(SNR))-12;
y1 = 1;
text(x1,y1,strText,'FontSize', fontSize)

% Get timestamp for saving files.
timeStamp = datestr(now,30);
fileName = sprintf('Figure4_MSE_under_random_large_scale_fading_M%d_K%d_L%d_N%d_v0_%s.fig',M,K,L,N,timeStamp);
savefig(fdee_figure,fileName);

% Save workspace to .mat file.
clear fdee_figure
fileName = sprintf('Figure4_MSE_under_random_large_scale_fading_M%d_K%d_L%d_N%d_v0_%s.mat',M,K,L,N,timeStamp);
save(fileName);