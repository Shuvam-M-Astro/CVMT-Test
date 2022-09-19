function recordError(error)
% recordError in txt format

fid = fopen('error.txt','w');
fprintf(fid, '%s \n\n\n', error.getReport('extended', 'hyperlinks','off'));
fclose(fid);