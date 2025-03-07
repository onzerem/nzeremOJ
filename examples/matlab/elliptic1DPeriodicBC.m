% ====================== Test 5 =====================
% 1D Poisson BVP: Periodic BC
% - u'' = 4 pi^2 sin(2 pi x), 0 < x < 1, u(0) = u(1), u'(0) = u'(1)
% exact solution: u(x) = sin(2 pi x) + constant
% ===================================================
% example that uses addBC1D
% testing 1D bc
%
close all; clc;

addpath('../../src/matlab');

k = 2;
bvp = 5;
m = 20; 
dx = 1/m;
% centers and vertices
xc = [0 dx/2:dx:1-dx/2 1]';
t = '- u" = 4 pi^2 sin(2 pi x), 0 < x < 1, u(0) = u(1), u''(0) = u''(1), with exact solution u(x) = sin(2 pi x) + constant';
ue = sin(2*pi*xc); % exact solution
dc = [0;0];
nc = [0;0];
v = [0;0];
A = - lap(k,m,dx);
b = 4*pi^2 * sin(2*pi*xc);
[A0,b0] = addBC1D(A,b,k,m,dx,dc,nc,v);
ua = A0\b0; % approximate solution (there are infinity solutions) 
ua = ua - ua(1) + ue(1); % shifting ua to match ue(1) with ua(1)

% plot
figure(bvp)
plot(xc,ue,'b*',xc,ua,'ro');
title(t); %,'interpreter','latex');
xlabel('x');
ylabel('u');
legend({'exact','approx'});
