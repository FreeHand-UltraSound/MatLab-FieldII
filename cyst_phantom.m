% Create a computer model of a cyst phantom. The phantom contains
% five point targets separated by 5 mm and a 10 mm water filled cyst. 
% All scatterers are situated in a box of (x,y,z)=(40,10,50) mm.

% Calling: [positions, amp] = cyst_phantom (N); %
%  Parameters:  N- Number of scatterers in the phantom

%  Output: positions - Positions of the scatterers
%          amp       - Amplitude of the scatterers

% Version 1.1, March 22, 2011 by Joergen Arendt Jensen 

function [positions, amp] = cyst_phantom (N, radius)
    x_size = 40/1000;   %  Width of phantom [m]
    y_size = 10/1000;   %  Transverse width of phantom [m]
    z_size = 50/1000;   %  Height of phantom [m]
    z_start = 30/1000;  %  Start of phantom surface [m];

    %  Create the general scatterers 
    x = (rand (N,1)-0.5)*x_size;
    y = (rand (N,1)-0.5)*y_size;
    z = rand (N,1)*z_size + z_start;
    
    % Generate the amplitudes with a Gaussian distribution 
    amp = randn(N,1);
    
    % Make the cyst and set the amplitudes to zero inside
    r = radius; % Radius of cyst [m] 
    xc = 0/1000; % Place of cyst [m] 
    zc = 25/1000+z_start;
    
    inside = ( ((x-xc).^2 + (z-zc).^2) < r^2); 
    amp = amp .* (1-inside);
    
    %  Place the point scatterers in the phantom
    dz = z_size/10; 
    
    for i = N-9:N
        x(i) = -15/1000;
        y(i) = 0;
        z(i) = z_start + (i-N+9)*dz; 
        amp(i) = 100;
    end
    
    % Return the variables 
    positions=[x y z];
end