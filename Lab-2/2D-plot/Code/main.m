clc;
clear all;
close all;

tic;                        % Start timer

XMAX = 5;                   % Size of mesh
STEP = 0.5;                 % Step of mesh
TMAX = 10;                  % Time of modeling

[x1, x2] = meshgrid(-XMAX: STEP: XMAX); 

dxdt = @(t, x) model(t, x);
event_out_of_bounds = @(t, z) outOfBounds(t, z, XMAX+0.01);

plotLocus(x1, x2, dxdt, event_out_of_bounds, TMAX); % Plot phase portrait
plotQuiver(x1, x2, dxdt); % Plot direction

toc;                        % Stop timer

%% Function of phase portrait to plot

function dxdt = model(t, x)
%   Define the nonlinear, continious-time, state-space model
%   t is the time;
%   x it the vector of state coordinates

dxdt(1,:) = x(2,:);
dxdt(2,:) = x(2,:) + x(1,:).^2 - 5 * sin( 0.3 * x(1,:).^2);

end