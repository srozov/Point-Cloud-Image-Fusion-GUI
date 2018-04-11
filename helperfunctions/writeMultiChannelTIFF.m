function writeMultiChannelTIFF(data, filename, bits)
% writeTIFF(data, filename,bits)
% writes data as a multi-channel TIFF with single prec. float pixels
   t = Tiff(filename, 'w');
   tagstruct.ImageLength = size(data, 1);
   tagstruct.ImageWidth = size(data, 2);
   tagstruct.Compression = Tiff.Compression.None;
   %tagstruct.Compression = Tiff.Compression.LZW;        % compressed
   tagstruct.SampleFormat = Tiff.SampleFormat.IEEEFP; %float
   %tagstruct.SampleFormat = Tiff.SampleFormat.UInt; %UInt
   tagstruct.Photometric = Tiff.Photometric.MinIsBlack;
   tagstruct.BitsPerSample =  bits;                        % (u)int16 data
   tagstruct.SamplesPerPixel = size(data,3);
   tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky;
   t.setTag(tagstruct);
   t.write(single(data)); %t.write(data); 
   t.close();