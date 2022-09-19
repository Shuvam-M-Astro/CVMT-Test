function win= data()


%which screen?
win.screenNo  = max(Screen('Screens')); % external monitor if attached
win.screenRes = [0 0 640 480];          % small screen in top left corner for testing

