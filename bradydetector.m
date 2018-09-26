function [results,vt,tag,tagname] = bradydetector(filename,vdata,vname,vt,threshold,pmin,tmin)

% [vdata,vname,vt,~]=gethdf5vital(filename);
if isempty(vdata)
    load(filename,'values','vlabel','vt','vuom')
    [vdata,vname,vt]=getWUSTLvital2(values,vt,vlabel);
end
% if sum(contains(vname,'/VitalSigns/SPO2-R'))
%     dataindex = ismember(vname,'/VitalSigns/SPO2-R');
% elseif sum(contains(vname,'/VitalSigns/PULSE'))
%     dataindex = ismember(vname,'/VitalSigns/PULSE');
% end
% spo2rdata = vdata(:,dataindex);
if sum(contains(vname,'/VitalSigns/HR'))
    dataindex = ismember(vname,'/VitalSigns/HR');
elseif sum(contains(vname,'HR'))
    dataindex = ismember(vname,'HR');
elseif sum(contains(vname,'/VitalSigns/PR'))
    dataindex = ismember(vname,'/VitalSigns/PR');
else
    results = [];
    tag = [];
    tagname = [];
    return
end
hrdata = vdata(:,dataindex);
hrdata(hrdata<=1) = nan;
period = median(diff(vt/1000));
fs = 1/period;

[tag,tagname]=threshtags(hrdata,vt,threshold,ceil(pmin*fs),tmin,1);

[~,startindices] = ismember(tag(:,1),vt);
[~,endindices] = ismember(tag(:,2),vt);
results = zeros(length(hrdata),1);
for i=1:length(startindices)
    results(startindices(i):endindices(i))=1;
end