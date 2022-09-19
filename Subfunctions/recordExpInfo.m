function recordExpInfo(vpNum, resDir, expName)
% recordExpInfo(vp,resDir, expName)
%
% Record Exp Info such as Matlab version, PTB3 version, computer info,
%   and screen resolution to separate *.txt file

% record details
fid = fopen([resDir filesep expName '_ExpInfo_' num2str(vpNum) '.txt'],'w');

% experiment name
fprintf(fid, ['Experiment: ' expName '\n\n']);

% write date and time
fprintf(fid, '%s\n\n', datestr(now, 30));

% record some MATLAB and psychtoolbox version details
[~, ver] = PsychtoolboxVersion;
fprintf(fid,'MATLAB Version: %s\n', version);
fprintf(fid,'Psychtoolbox Version: %d.%d.%d\t%d\n\n', ver.major, ver.minor, ver.point, ver.revision);

% computer info
fprintf(fid, 'Computer Info\n');
fprintf(fid, '%s\n\n', computer);

fclose(fid);
