function [masteralgmask,algmask_newqrs,resultname] = algmask
masteralgmask = {...
        'QRS Detection: ECG I',2;...
        'QRS Detection: ECG II',2;...
        'QRS Detection: ECG III',2;...
        'CU Artifact',1;...
        'WUSTL Artifact',1;...
        'Brady Detection',2;...
        'Desat Detection <80',2;...
        'Apnea Detection with ECG Lead I',3;...
        'Apnea Detection with ECG Lead II',3;...
        'Apnea Detection with ECG Lead III',3;...
        'Apnea Detection with No ECG Lead',3;...
        'Apnea Detection',2;...
        'Periodic Breathing with ECG Lead I',2;...
        'Periodic Breathing with ECG Lead II',2;...
        'Periodic Breathing with ECG Lead III',2;...
        'Periodic Breathing with No ECG Lead',2;...
        'Periodic Breathing',1;...
        'Brady Detection Pete',2;...
        'Desat Detection Pete',2;...
        'Brady Desat',2;...
        'Brady Desat Pete',2;...
        'ABD Pete No ECG',3;...
        'ABD Pete',2;...
        'Save HR in Results',1;...
        'Data Available: Pulse',2;...
        'Data Available: HR',2;...
        'Data Available: SPO2_pct',2;...
        'Data Available: Resp',2;...
        'Data Available: ECG I',2;...
        'Data Available: ECG II',2;...
        'Data Available: ECG III',2;...
        'Desat Detection <85',1;...
        'Desat Detection <90',1};
    
resultname = {...
        '',2;...
        '',2;...
        '',2;...
        '/Results/CUartifact',1;...
        '/Results/WUSTLartifact',1;...
        '/Results/Brady<100',2;...
        '/Results/Desat<80',2;...
        '/Results/Apnea-I',3;...
        '/Results/Apnea-II',3;...
        '/Results/Apnea-III',3;...
        '/Results/Apnea-NoECG',3;...
        '/Results/Apnea',2;...
        '/Results/PeriodicBreathing-I',2;...
        '/Results/PeriodicBreathing-II',2;...
        '/Results/PeriodicBreathing-III',2;...
        '/Results/PeriodicBreathing-NoECG',2;...
        '/Results/PeriodicBreathing',1;...
        '/Results/Brady<100-Pete',2;...
        '/Results/Desat<80-Pete',2;...
        '/Results/BradyDesat',2;...
        '/Results/BradyDesatPete',2;...
        '/Results/ABDPete-NoECG',3;...
        '/Results/ABDPete',2;...
        '/Results/HR',1;...
        '/Results/DataAvailable:Pulse',2;...
        '/Results/DataAvailable:HR',2;...
        '/Results/DataAvailable:SPO2_pct',2;...
        '/Results/DataAvailable:Resp',2;...
        '/Results/DataAvailable:ECGI',2;...
        '/Results/DataAvailable:ECGII',2;...
        '/Results/DataAvailable:ECGIII',2;...
        '/Results/Desat<85',1;...
        '/Results/Desat<90',1};

algmask_newqrs = [1:3,6:7,32:33,12,17:21,23,25:31];
