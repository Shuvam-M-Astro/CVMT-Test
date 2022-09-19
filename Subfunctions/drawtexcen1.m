function drawtexcen = drawtexcen1(win,matrix,y,ctrY,TIME,flipInt);

image   = imread([num2str(y) '.png']);
imgRect = RectOfMatrix(image);
[imgCtrX, imgCtrY] = RectCenter(imgRect);
imageTexture1 = Screen('MakeTexture', win, image);
destRect = CenterRectOnPoint([0 0 100 100], 320, ctrY);
Screen('DrawTexture', win, imageTexture1, [], destRect);

VBLTimestamp = Screen('Flip', win);
VBLTimestamp = Screen('Flip', win, VBLTimestamp + TIME - (flipInt/2));

matrix = [matrix,y];

drawtexcen.matrix = matrix;