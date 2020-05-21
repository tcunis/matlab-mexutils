clear; close all; drawnow

obj = mexClass

obj.VarA = 5; % good
obj.VarB = 1:10; % good
try
   obj.VarC = 0; % invalid
catch ME
   disp(getReport(ME)); % display the error message
   obj.VarC = 'test'; % good
end

%
mexClass.static_fcn()

obj.train();
try
   obj.test();
catch ME
   disp(getReport(ME));
   obj.test(5);
end

save testdata obj
clear
load testdata
