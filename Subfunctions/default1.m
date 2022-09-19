function default = default1()

%Define a large empty matrix.
default.matrix = [];
%P = [];


%Define an array from 1 - 30. (Total Stimuli). (Could be a Function)
%n = 30;
default.num = 30;
%TOTAL = [1:n];
default.TOTAL = [1:default.num];

%Define array of repeating stimuli (e,g [2 5 4 24 13]).
default.a = 4;
default.b = 14;
default.c = 23;
default.d = 25;
default.e = 29;
%REP = [a b c d e];
default.REP = [default.a default.b default.c default.d default.e];

%Define array of non - repeating stimuli. (1 - (Repeating Array)).
%NREP = setdiff(TOTAL,REP);
default.NREP = setdiff(default.TOTAL,default.REP);

% Places where the repeating stimuli show up
nn = 50;
default.TOTALT = [1:nn];
default.REPT = [1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41 43 45 47 49];
default.REPT = [1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41 43 45 47 49];
%NREPT = setdiff(default.TOTALT,default.REPT);
default.NREPT = setdiff(default.TOTALT,default.REPT);