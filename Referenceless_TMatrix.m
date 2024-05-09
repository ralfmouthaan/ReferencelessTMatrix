% Ralf Mouthaan
% University of Adelaide
% May 2024
%
% Referenceless T-Matrix calculation
% 1D case considered. Easily extended to 2D case by vectorising 2D case.

clc; clear variables; close all;

%% User-Defined

Nin = 10;  % Number of input pixels
Nout = 20; % Number of output pixels
Nmeas = 100; % Number of measurements

%% Initialise

T = rand([Nout, Nin]).*exp(2*pi*1i*rand([Nout, Nin]));       % Ground truth transmission matrix
Ein = rand([Nin, Nmeas]).*exp(2*pi*1i*rand([Nin, Nmeas]));   % Vector of input fields. Mag + Phase known.
EinInv = pinv(Ein);      % Precalculate inverse for efficiency
EoutObs = abs(T*Ein);    % Observed vector output fields. Only Mag is known.

%% Gerchberg-Saxton

Eout = EoutObs; % Eout is our estimate of the complex vector of output fields. Initial guess is just equal to EoutObs
for i = 1:100
    Test = Eout*EinInv; % Estimate transmission matrix
    Eout = Test*Ein;    % Estimate Eout for current transmission matrix
    Eout = EoutObs.*exp(1i*angle(Eout)); % Set magnitude of Eout to known values.
end

%% Evaluate

EinTest = rand([Nin, 1]) + 1i*rand([Nin, 1]); % Generate a test vector

% Magnitudes are correctly estimated:
figure; 
plot(abs(T*EinTest), 'r-');
hold on
plot(abs(Test*EinTest), 'bo');
legend('Ground Truth', 'Estimate')
xlabel('Index');
ylabel('Magnitude');

% Phases are incorrectly estimated:
figure;
plot(angle(T*EinTest), 'r-');
hold on
plot(angle(Test*EinTest), 'bo');
legend('Ground Truth', 'Estimate')
xlabel('Index');
ylabel('Phase');