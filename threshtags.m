function [tag,tagname]=threshtags(x,xt,T,pmin,tmin)
% function [tag,tagname]=threshtags(x,xt,T,pmin,tmin)
%
% x = input signal
% x = input signal timestamps
% T = threshold for event
% pmin = minimum number of points below threshold (default one)
% tmin = time gap between crossings to join (default zero)
%
% tag = tag times and info
% tagname = name of tagput data

tagname=cell(6,1);
tagname{1}='Start';
tagname{2}='Stop';
tagname{3}='Duration';
tagname{4}='Number points';
tagname{5}='Area';
tagname{6}='Minimum';
tag=zeros(0,length(tagname));

% Get rid of missing data
j=find(isnan(x));
x(j)=[];
xt(j)=[];
if isempty(x),return,end

if ~exist('tmin','var'),tmin=0;end
if ~exist('pmin','var'),pmin=1;end

% if length(tmin)>1
%     tmin=tmin(1);
%     gmin=tmin(2);
% else
%     gmin=0;
% end   
% if length(pmin)>1
%     pmin=pmin(1);    
%     dmin=pmin(2);
% else
%     dmin=0;
% end

% Find crossing events with minimum number of points
[i1,i2]=threshcross(x,T,pmin);
if isempty(i1),return,end

t1=xt(i1);
t2=xt(i2);
%Get rid of crossing events less than minimum time duration
% if dmin>2
%     dur=t2-t1+2;    
%     j=dur<dmin;
%     i1(j)=[];
%     i2(j)=[];
% end

%Join events with minimum time gap
if tmin>0
    [k1,k2]=tagjoin(t1,t2,tmin);   
    j1=i1(k1);
    j2=i2(k2);
else
    j1=i1;
    j2=i2;
end    
t1=xt(j1);
t2=xt(j2);
ne=length(j1);
dur=t2-t1+2;
%np=j2-j1+1;
np=zeros(ne,1);
area=zeros(ne,1);
xmin=NaN*ones(ne,1);
for i=1:ne
    j=(j1(i):j2(i))';
    xx=x(j);
    xmin(i)=min(xx);
    aa=max(T+1-xx,0);
    area(i)=sum(aa);
    np(i)=sum(xx<=T);
end
tag=[t1 t2 dur np area xmin];