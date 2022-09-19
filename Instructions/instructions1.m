function instructions = instructions1(win,BLACK,TIME,flipInt)

%Initialize text and draw
txt =  sprintf('Continuous Visual Memory Test');
DrawFormattedText(win, txt, 'center', 'center',BLACK,40);
VBLTimestamp = Screen('Flip', win);
VBLTimestamp = Screen('Flip', win, VBLTimestamp + 2 - (flipInt/2));

txt =  sprintf('Part 1');
DrawFormattedText(win, txt, 'center', 'center',BLACK,40);
VBLTimestamp = Screen('Flip', win);
VBLTimestamp = Screen('Flip', win, VBLTimestamp + 2 - (flipInt/2));

txt =  sprintf('A stimulus will be displayed on the screen for 2 seconds. This will be repeated for 50 different stimuli. Out of these 50 displayed stimuli, 5 stimuli will be repeated 5 times (25/50). The others will only be displayed once (25/50). After each stimulus is displayed, the participant will be asked to select whether the displayed stimulus was new or old.  Total score is calculated for correct old/new answers. (0-50)');
DrawFormattedText(win, txt, 'center', 'center',BLACK,40);
VBLTimestamp = Screen('Flip', win);
VBLTimestamp = Screen('Flip', win, VBLTimestamp + TIME - (flipInt/2));

instructions.inc = 1;


end