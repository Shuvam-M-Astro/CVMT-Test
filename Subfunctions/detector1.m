function detector = detector1(win,BLACK,matrix,y,Counter1);

[keyIsDown, ~, keyCode] = KbCheck ;
                    exit = false;
                    while ~exit


                        [keyIsDown, ~, keyCode] = KbCheck;
                        if keyIsDown;
                            if keyCode(KbName('R'));
                                % IF IT IS REPEATING
                                if histc(matrix(:),y) == 1
                                    exit = true;
                                else
                                    Counter1 = Counter1+1;
                                    exit = true;
                                end

                            elseif keyCode(KbName('N'));
                                %If non-repeating
                                if histc(matrix(:),y) == 1
                                    Counter1 = Counter1+1;
                                    exit = true;
                                else    
                                    exit = true;
                                end
                            elseif keyCode(KbName('escape'));
                                sca;
                                ListenChar(0);
                            end
                        end     
                            DrawFormattedText(win, 'PRESS R IF YOU THINK THAT THE PATTERN IS REPEATING', 200, 120, BLACK, 18);
                            DrawFormattedText(win, 'PRESS N IF YOU THINK THAT THE PATTERN IS UNIQUE', 200, 360, BLACK, 18);
                            
                            Screen('Flip', win);
                        end

detector.Counter1 = Counter1;
