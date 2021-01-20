% Function to call LinearArrayImaging N times to create N frames of the phantom cyst. 
% Each call will have a different value for the radius, corresponding to a
% displacement made by the probe.
%
% Assumptions: 
%       - Radius: r = 5/10^3 [m]
%       - Displacement: d = 5/10^4 [m]
%       - N = r / d

% Variables in meters
cyst_radius = 5 / 1000;
d = 5 / 10000;

for m = d:d:(cyst_radius-d)
    
    r = sqrt((cyst_radius^2) - (m^2))
    
    % Call LinearArrayImaging
    [x, depth, env_gray] = LinearArrayImaging(r);

    % Create the Ultrsound images, when we obtain the matlab figure
    % remember to save them as TIFF files (.tif), after this you can run
    % DICOMnaming.m or an edited version of it to conver the TIFF files
    % into DICOM (.dcm)
    image(x*1000, depth*1000, env_gray)
    xlabel('Lateral distance [mm]') 
    ylabel('Depth [mm]')
    axis('image')
    colormap(gray(128))
    title('Image of cyst phantom (60 dB dynamic range)')

end