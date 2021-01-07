function [masteralgmask,algmask_newqrs] = algmask
masteralgmask = {...
        'QRS Detection: ECG I',1;...
        'QRS Detection: ECG II',1;...
        'QRS Detection: ECG III',1;...
        'CU Artifact',1;...
        'WUSTL Artifact',1;...
        'Brady Detection',2;...
        'Desat Detection',2;...
        'Apnea Detection with ECG Lead I',2;...
        'Apnea Detection with ECG Lead II',2;...
        'Apnea Detection with ECG Lead III',2;...
        'Apnea Detection with No ECG Lead',2;...
        'Apnea Detection',1;...
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
        'Data Available: ECG III',2};

algmask_newqrs = [1:3,6:7,12,17:21,23,25:31];
