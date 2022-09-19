function CVMT
%Continuous Visual Memory Test%

%----------------------Part 1 : - (Single Repeated Stimulus Recognition)----------------------%

%----------------------------------------Instructions-----------------------------------------%

% A stimulus will be displayed on the screen for 2 seconds. This will
% be repeated for 50 different stimuli. Out of these 50 displayed stimuli,
% 5 stimuli will be repeated 5 times (25/50). The others will only be
% displayed once (25/50). After each stimulus is displayed, the participant
%will be asked to select whether the displayed stimulus was new or old. 
%total score is calculated for correct old/new answers. (0-50)

%-------------------------------------------------------------------------------------------------%


% add SubFunctions folders to MATLAB path + define instructions/results directory
addpath([pwd filesep 'SubFunctions'])
addpath([pwd filesep 'Images'])
addpath([pwd filesep 'Instructions']);
resDir      = ([pwd filesep 'Results']);

% get participant info
vp = vpInfo(resDir, mfilename);
recordExpInfo(vp.vpNum, resDir, mfilename);

% start PsychtoolBox and record experiment information
PsychDefaultSetup(1);  % AssertOpenGL/UnifyKeyNames/
ListenChar(2);         % prevent command line keypresses

% skip sync tests ONLY for testing!
Screen('Preference', 'SkipSyncTests', 2);

% colours
WHITE = [255 255 255];
GREEN = [  0 255   0];
BLACK = [0 0 0]; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%which screen?
win = data();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% open window
[win, rect]  = Screen('OpenWindow', win.screenNo, WHITE, win.screenRes);
[ctrX, ctrY]      = RectCenter(rect);

%Initialize flipInt for VBLTimeStamp
flipInt = Screen('GetFlipInterval', win);

try % put our PTB code within a try/catch loop
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Defaults.
default = default1();
matrix = default.matrix;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Define Counters.
counter = counter1();
Counter1 = counter.Counter1;
Counter2 = counter.Counter2;

% Display Instructions
instructions = instructions1(win,BLACK,10,flipInt);
instructions.inc;

%-----------------------------PART 1 ------------------%
%Open Log file.
    vpNum = vp.vpNum;
    fid = fopen([resDir filesep mfilename '_LOG_' num2str(vpNum) '.txt'],'w');
    fprintf(fid,'Experiment: CVMT\n\n');
    fprintf(fid,'Repeating stimuli: %d\n', default.a,default.b,default.c,default.d,default.e);
    fprintf(fid,'\n\n');
    fprintf(fid,'Part: 1\n\n');

%#Loop the program 50 times.
[xPos, yPos, buttons] = GetMouse;
for i = 1:50
        %If the iteration number matches the iteration numbers for
        %repeating stimuli.
        if intersect(i,default.REPT) == i
            %Select repeating stimulus.
            y = default.REP(randi(numel(default.REP)));
            %If repeating stimulus repeats 5 times, delete it from the
            %matrix.
            if y == default.a & histc(matrix(:),default.a) == 5 | y == default.b & histc(matrix(:),default.b) == 5 | y == default.c & histc(matrix(:),default.c) == 5| y == default.d & histc(matrix(:),default.d) == 5 | y == default.e & histc(matrix(:),default.e) == 5
                default.REP(default.REP == y) = [];
                %Find repeating stimulus again.
                y = default.REP(randi(numel(default.REP)));
                %Draw texture.
                drawtexcen = drawtexcen1(win,matrix,y,ctrY,2,flipInt);
                matrix = drawtexcen.matrix;
                %Detector/User input loop.
                detector = detector1(win,BLACK,matrix,y,Counter1);
                %Increment Counter.
                Counter1 = 0 + detector.Counter1;
                fprintf(fid,'Stimulus Number: %d\n', y);
                fprintf(fid,'Total Score: %d\n', Counter1);
            else
                
                %If repeating stimulus does not repeat 5 times, draw it.
                drawtexcen = drawtexcen1(win,matrix,y,ctrY,2,flipInt);
                matrix = drawtexcen.matrix;
                %Detector/User input loop.
                detector = detector1(win,BLACK,matrix,y,Counter1);
                %Increment Counter. 
                Counter1 = 0 + detector.Counter1;
                fprintf(fid,'Stimulus Number: %d\n', y);
                fprintf(fid,'Total Score: %d\n', Counter1);
                
            end
        else
            %Select Non-Repeating Stimulus
            y = default.NREP(randi(numel(default.NREP)));
            %Draw it and delete from matrix
            drawtexcen = drawtexcen1(win,matrix,y,ctrY,2,flipInt);
            matrix = drawtexcen.matrix;
            default.NREP(default.NREP == y) = [];
            %Detector/User input loop.
            detector = detector1(win,BLACK,matrix,y,Counter1);
            %Increment Counter.
            Counter1 = 0 + detector.Counter1;
            fprintf(fid,'Stimulus Number: %d\n', y);
            fprintf(fid,'Total Score: %d\n', Counter1);
        end
end

%-----------------------------PART 1 END------------------%


%----Part 2 : - (Delayed Recognition of repeated stimulus among a group of distractions)------%

%----------------------------------------Instructions-----------------------------------------%

%1 of the repeated stimuli will be displayed among a group of 4 with 3
%random distracting stimuli. After showing these stimuli to the participant
%for 10 seconds, the participant will be asked to decide which of the
%stimuli was previously repeated. There will be 5 sets of such a setup and
%the total score is calculate for the number of correct answers for the
%repeated stimuli. (0-5).

%-------------------------------------------------------------------------------------------------%
%Start log for Part 2
fprintf(fid,'\n\n');
fprintf(fid,'Part: 2\n\n');

%Display Instructions
instruct = instructions2(win,BLACK,10,flipInt);
instruct.inc = 1;

%Initialize default variables
default = default1();
NREP = default.NREP; 
REP = default.REP;

%Loop the test 5 times
for i = 1:5
    %Initialize all x-coordinate positions
    POS = [80 240 400 560];

    %Find repeating and non-repeating stimuli
    y1 = REP(randi(numel(REP)));
    REP(REP == y1) = [];
    y2 = NREP(randi(numel(NREP)));
    NREP(NREP == y2) = [];
    y3 = NREP(randi(numel(NREP)));
    NREP(NREP == y3) = [];
    y4 = NREP(randi(numel(NREP)));
    NREP(NREP == y4) = [];
    
    %Draw array of pictures
    drawarr = drawarr1(win,BLACK,matrix,Counter2,POS,y1,y2,y3,y4,NREP,REP,ctrY,10,flipInt);
    POS1 = drawarr.POS1;
    
    %Detector/User Input loop
    detect = detect2(win,BLACK,matrix,Counter2,POS1);
    %Increment Counter.
    Counter2 = 0 + detect.Counter2;
                    
    fprintf(fid,'Stimulus Number: %d\n', y1);
    fprintf(fid,'Position: %d\n', POS1);
    fprintf(fid,'Total Score: %d\n', Counter2);

end

%------------------PART 2 END---------------------------------------%
    %Display Score and end
    score = score1(win,BLACK,Counter1,Counter2,flipInt);
    score.buffer;
sca % screen clear all

%Close Log file
    fclose(fid);

catch error % what happens if there was an error
  
  % record error log, write results file and end experiment
  recordError(error)
  
end
end



