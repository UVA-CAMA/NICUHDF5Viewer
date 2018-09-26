function [results,vt] = wustl_artifact_removal(filename,thresh,vdata,vname,vt)
e_size = 30; % epoch size: the number of samples in each epoch
% thresh = 50; % Threshold for spo2 values to determine if they are non-physiologic. Any spo2 value below this level is determined to be "missing" data
% [vdata,vname,vt,~]=gethdf5vital(filename);
if isempty(vdata)
    load(filename,'values','vlabel','vt','vuom')
    [vdata,vname,vt]=getWUSTLvital2(values,vt,vlabel);
end
if sum(contains(vname,'/VitalSigns/SPO2-%'))
    dataindex = ismember(vname,'/VitalSigns/SPO2-%');
elseif sum(contains(vname,'/VitalSigns/SPO2-perc'))
    dataindex = ismember(vname,'/VitalSigns/SPO2-perc');
elseif sum(contains(vname,'/VitalSigns/SPO2_pct'))
    dataindex = ismember(vname,'/VitalSigns/SPO2_pct');
elseif sum(contains(vname,'/VitalSigns/SPO2'))
    dataindex = ismember(vname,'/VitalSigns/SPO2');
elseif sum(contains(vname,'SPO2'))
    dataindex = ismember(vname,'SPO2');
elseif sum(contains(vname,'/VitalSigns/SpO2'))
    dataindex = ismember(vname,'/VitalSigns/SpO2');
else
    results = [];
    vt = [];
    return
end
spo2data = vdata(:,dataindex);
numsamps = length(spo2data);
nepochs = floor(numsamps/e_size); % The number of epochs, given that each epoch is 60 seconds (i.e. 30 samples)
e_artifact = zeros(nepochs,1); % Epoch artifact: if 1, at least 50% of the epoch has missing data
results = zeros(numsamps,1);

% Run artifact check on each epoch sequentially
for e=1:nepochs
    % Pull out data for just one epoch
    indices = e_size*e-e_size+1:e_size*e;
    epoch = spo2data(indices);
    
    % Check for "missing" data: i.e. nans or low values (<thresh)
    num_nans = sum(isnan(epoch));
    num_lows = sum(epoch<thresh);
    if num_nans+num_lows>e_size/2 % If over 50% of the data in the epoch is bad, mark the epoch as bad
        e_artifact(e) = 1;
%         fillbar(e);
%         hold on
    end
    % Epochs with a change greater than 3% between serial data points were 
    % judged to be contaminated with motion artifact and were discarded
    if sum(abs(diff(epoch))>3)>0
        e_artifact(e) = 1;
%         fillbar(e);
%         hold on
    end
    if e_artifact(e)==1
        results(e*30-29:e*30,1) = e_artifact(e);
    end
end
% plot(spo2data,'r')
end

function fillbar(e)
x1 = 30*e-30;
x2 = 30*e;
y2 = [0 250];
h = fill([x1 x1 x2 x2], [y2 fliplr(y2)], [0.85 0.25 0.25],'EdgeColor','none');
alpha(h,0.3);
end
