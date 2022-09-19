function score = score1(win,BLACK,Counter1,Counter2,flipInt)

%Initialize text and draw
txt = sprintf('Score on First Test:%d\nScore on Second Test:%d', Counter1,Counter2);
        DrawFormattedText(win, txt, 'center', 'center');
        VBLTimestamp = Screen('Flip', win);
          VBLTimestamp = Screen('Flip', win, VBLTimestamp + 2 - (flipInt/2));  

    DrawFormattedText(win, 'THANK YOU FOR PARTICIPATING', 'center', 'center', BLACK, 18);

    VBLTimestamp = Screen('Flip', win);
    VBLTimestamp = Screen('Flip', win, VBLTimestamp + 2 - (flipInt/2)); 


score.buffer = 1;