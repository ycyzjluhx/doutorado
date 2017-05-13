clear all;close all;clc

SNR = 100;          % Signal-to-noise ratio in dB.

M = 10;             % Number of antennas.
K = 2;              % Number of single-antenna users.
P = 4;              % Channel Length (Finite Impulse Response - FIR).
L = 3;              % Number of cells.

N = 13;             % Pilot length.
q = 100;            % Uplink pilot power.

% Pilot signal generation
S = [];
for k_idx=1:1:K
    s_aux = generatePilotMatrixv1(N, P, k_idx);
    if(k_idx==1)
        S1 = s_aux;
    end    
    S = [S, s_aux];
end

% Noise generation
W = (1/sqrt(2))*complex(randn(M,N),randn(M,N));

% Received pilot symbols at BS i.
Y1 = complex(zeros(M,N),zeros(M,N));
for l_idx=1:1:L
    
    C = [];
    for k_idx=1:1:K
        g = (1/sqrt(2))*complex(randn(M,P),randn(M,P));
        beta = abs(randn(1,M));
        beta = diag(beta);        
        c = sqrt(beta)*g;       
        C = [C, c];
        
        if(l_idx==1 && k_idx==1)
            C111 = c;
        end
    end
    
    Y1 = Y1 + sqrt(q)*C*(S');
    
end

Y1 = Y1 + W;

% Least Squares Solution.
Z11 = (1/(sqrt(q)*N))*Y1*S1;

error = (Z11'-C111')*(Z11-C111);