function vp = vpInfo(resDir, expName)
% vp = vpInfo(resDir, mfilename, varargin)
%
% Returns basic info about a participant. The default questions are vp
%   number, age, gender, and handedness. All responses are returned in
%   a single structure. Additional questions can be added using key-value
%   pairs (e.g., 'name', allowedSelection). The function will also check
%   is existing results files already exist and if so, will ask whether
%   to overwrite or to abort.
%
% Examples:
% vp = vpInfo(pwd, 'flanker')
% vp = vpInfo(pwd, 'flanker', 'mapping', [1 2])
% vp = vpInfo(resDir, mfilename, 'eye', {'l' 'r'})

clc

% participant number?
vp.vpNum = NaN;
while isnan(vp.vpNum) || ~ismember(vp.vpNum, 1:1000)
  vp.vpNum = str2double(input('Versuchsperson nummer?: ', 's'));
end

% result file
resFileName = [resDir filesep expName '_' num2str(vp.vpNum) '.txt'];

% does file already exist?
if exist(resFileName, 'file')
  
  check = '';
  while ~ismember(check, {'y' 'n'})
    check = lower(input('Results file already exists! Delete existing file?: (y/n) ', 's'));
  end
  
  if strcmp(check, 'y') % delete old files    
    delete([resDir filesep expName '_' num2str(vp.vpNum) '.txt']);
    delete([resDir filesep expName '_' num2str(vp.vpNum) '.mat']);
  elseif strcmp(check, 'n') % exit
    endExperiment
    error('Check participant number!');
  end
  
end

% participant details
fprintf('\nVersuchsperson: Bitte beantworten Sie die folgenden Fragen\n\n');

vp.gender = '';
while ~ismember(vp.gender, {'m' 'w' 'd'})
  vp.gender = lower(input('Geschlecht? (m/w/d): ', 's'));
end

vp.age = NaN;
while isnan(vp.age) || ~ismember(vp.age, 18:60)
  vp.age = str2double(input('Alter?: ', 's'));
end

vp.handedness = '';
while ~ismember(vp.handedness, {'l' 'r'})
  vp.handedness = lower(input('Händigkeit? (l/r): ','s'));
end


% record details
fid = fopen([resDir filesep expName '_VPInfo_' num2str(vp.vpNum) '.txt'],'w');
fprintf(fid,'Experiment: CVMT\n\n');
fprintf(fid,'Participant: %d\n', vp.vpNum);
fprintf(fid,'Gender: %s  \nAge: %d  \nHandedness: %s  \n', vp.gender, vp.age, vp.handedness);
fprintf(fid,'Date: %s', datestr(now));
fclose(fid);




