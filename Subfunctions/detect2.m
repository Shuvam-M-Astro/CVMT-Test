function detect = detect2(win,BLACK,matrix,Counter2,POS1);


[keyIsDown, ~, keyCode] = KbCheck ;
    exit = false;
    while ~exit
        [keyIsDown, ~, keyCode] = KbCheck ;
        if keyIsDown;
            %fprintf('Key Pressed\n')
            if keyCode(KbName('A'));
                % IF IT IS REPEATING
                if POS1 == 80
                    Counter2 = Counter2+1;
                    exit = true;
                else
                    exit = true;

                end
            %For non-repeating stimuli
            elseif keyCode(KbName('B'));
                if POS1 == 240
                    Counter2 = Counter2+1;
                    exit = true;

                else    
                    exit = true;

                end

            elseif keyCode(KbName('C'));
                if POS1 == 400
                    Counter2 = Counter2+1;
                    exit = true;

                else    
                    exit = true;

                end    

            elseif keyCode(KbName('D'));
                if POS1 == 560
                    Counter2 = Counter2+1;
                    exit = true;
                else    
                    exit = true;
         
                end  
            elseif keyCode(KbName('escape'));
                sca;
                ListenChar(0);
            end
        end



        DrawFormattedText(win, 'PRESS THE LETTER CORRESPONDING TO THE POSITION OF THE REPEATING STIMULUS', 'center', 'center', BLACK, 18);
        Screen('Flip', win); 
        end

detect.Counter2 = Counter2;