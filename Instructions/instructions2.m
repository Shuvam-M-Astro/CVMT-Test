function instruct = instructions2(win,BLACK,TIME,flipInt)

%Initialize text and draw
txt = sprintf('Part 2');
DrawFormattedText(win, txt, 'center', 'center',BLACK,40);
VBLTimestamp = Screen('Flip', win);
VBLTimestamp = Screen('Flip', win, VBLTimestamp + 2 - (flipInt/2));


txt = sprintf('1 of the repeated stimuli will be displayed among a group of 4 with 3 random distracting stimuli. After showing these stimuli to the participant for 10 seconds, the participant will be asked to decide which of the stimuli was previously repeated. There will be 5 sets of such a setup and the total score is calculate for the number of correct answers for the repeated stimuli. (0-5).');
DrawFormattedText(win, txt, 'center', 'center',BLACK,40);
VBLTimestamp = Screen('Flip', win);
VBLTimestamp = Screen('Flip', win, VBLTimestamp + TIME - (flipInt/2));

instruct.inc = 1;


end