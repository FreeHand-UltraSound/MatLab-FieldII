% File to write TIFF (.tif) files into DICOM (.dcm) files

%write DICOM figure

for a = 1:1:10
    % Finding the TIFF file name
    fileName = string(a);
    fileName = 'Cyst'+fileName+'.tif'
    IMG(a) = fileName;
    
    % Creating the DICOM file name
    DICOMfile = string(a);
    DICOMfile = 'DICOM'+DICOMfile+'.dcm';
    dicomwrite(imread(IMG(a)),DICOMfile);
end
