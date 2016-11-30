freqTab=[1 10 100 1000 10000]

frec=300;
%sim('classicLVariableInductorFrec')
t=inductance.time;
timeStab=t(find(t>0.005))
SetInd=inductance.data(:,1);
CalcInd=inductance.data(:,2);