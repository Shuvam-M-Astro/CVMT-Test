function drawarr = drawarr1(win,BLACK,matrix,Counter2,POS,y1,y2,y3,y4,NREP,REP,ctrY,TIME,flipInt)


    POS1 = POS(randi(numel(POS)));
    POS(POS == POS1) = [];
    REP(REP == y1) = [];
    matrix = [matrix,y1];

    POS2 = POS(randi(numel(POS)));
    POS(POS == POS2) = [];
    NREP(NREP == y2) = [];
    matrix = [matrix,y2];

    POS3 = POS(randi(numel(POS)));
    POS(POS == POS3) = [];
    NREP(NREP == y3) = [];
    matrix = [matrix,y3];

    POS4 = POS(randi(numel(POS)));
    POS(POS == POS4) = [];
    NREP(NREP == y4) = [];
    matrix = [matrix,y4];

    image1   = imread([num2str(y1) '.png']);
    image2   = imread([num2str(y2) '.png']);
    image3   = imread([num2str(y3) '.png']);
    image4   = imread([num2str(y4) '.png']);

    imgRect1 = RectOfMatrix(image1);
    imgRect2 = RectOfMatrix(image2);
    imgRect3 = RectOfMatrix(image3);
    imgRect4 = RectOfMatrix(image4);

    [imgCtrX1, imgCtrY1] = RectCenter(imgRect1);
    [imgCtrX2, imgCtrY2] = RectCenter(imgRect2);
    [imgCtrX3, imgCtrY3] = RectCenter(imgRect3);
    [imgCtrX4, imgCtrY4] = RectCenter(imgRect4);

    % make image image
    imageTexture1 = Screen('MakeTexture', win, image1);
    imageTexture2 = Screen('MakeTexture', win, image2);    
    imageTexture3 = Screen('MakeTexture', win, image3);
    imageTexture4 = Screen('MakeTexture', win, image4); 

    % show image with destination rectangle
    destRect1 = CenterRectOnPoint([0 0 100 100], POS1, ctrY);
    destRect2 = CenterRectOnPoint([0 0 100 100], POS2, ctrY);
    destRect3 = CenterRectOnPoint([0 0 100 100], POS3, ctrY);
    destRect4 = CenterRectOnPoint([0 0 100 100], POS4, ctrY);

    Screen('DrawTexture', win, imageTexture1, [], destRect1);
    Screen('DrawTexture', win, imageTexture2, [], destRect2);
    Screen('DrawTexture', win, imageTexture3, [], destRect3);
    Screen('DrawTexture', win, imageTexture4, [], destRect4);
    DrawFormattedText(win, 'A', 80-20, 360, BLACK);
    DrawFormattedText(win, 'B', 240-10, 360, BLACK); 
    DrawFormattedText(win, 'C', 400-5, 360, BLACK);
    DrawFormattedText(win, 'D', 540+15, 360, BLACK);

    VBLTimestamp = Screen('Flip', win);
    VBLTimestamp = Screen('Flip', win, VBLTimestamp + TIME - (flipInt/2));
    
drawarr.POS1 = POS1;