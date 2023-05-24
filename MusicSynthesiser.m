%__________________INITIALIISE FILE_________________%
clc
clear all
close all
%__________________CREATE FUNCTIONS_________________%
S = 44100;%sampling rate
note = @(f,d) 2*cos(2*pi*f*[0:1/S:d]);%takes frequency and time to create instantaneous amplitude
%__________________CREATE FREQUENCY CHART_________________%
fs = [329.63 246.94 196 146.83 110 82.41];%FREQUENCIES ARE FOR GUITAR
upper = (harmonic(fs)/50) + fs;
lower = fs - (harmonic(fs)/50);
for i=1:1:30
    add = (harmonic(upper(i,:))/50) + upper(i,:);
    upper = [upper' add']';
    subtract = lower(i,:) - (harmonic(lower(i,:))/50);
    lower = [lower' subtract']';
end
fs = [upper' fs' lower']';
fs = sort(fs);
%__________________CREATE SOUND MATRICES___________________%
x1 = [];
x2 = [];
x3 = [];
x4 = [];
x5 = [];
x6 = [];
select = zeros(size(fs,1),1);
ds = 0.01 * ones(size(select,1),size(select,2));
for i=1:1:size(fs,2)%for number of frequencies in he frequency matrix,
    select = fs(:,i);%create a select matrix - ALL ROWS OF ith COLUMN
    switch i%create sound matrix for a given frequency
        case 1 %e
             for j=1:size(select,1)%for all rows in the selected column,
                 x1 = [x1 note(select(j,:), ds(j,:))];%create note matrix of 1 row
             end            
        case 2 %a
            for j=1:size(select,1)%for all rows in the selected column,
                 x2 = [x2 note(select(j,:), ds(j,:))];%create note matrix of 1 row
            end
        case 3 %d
            for j=1:size(select,1)%for all rows in the selected column,
                 x3 = [x3 note(select(j,:), ds(j,:))];%create note matrix of 1 row
            end 
        case 4 %g
            for j=1:size(select,1)%for all rows in the selected column,
                 x4 = [x4 note(select(j,:), ds(j,:))];%create note matrix of 1 row
            end
        case 5 %f
            for j=1:size(select,1)%for all rows in the selected column,
                 x5 = [x5 note(select(j,:), ds(j,:))];%create note matrix of 1 row
            end
        case 6 %e'
            for j=1:size(select,1)%for all rows in the selected column,
                 x6 = [x6 note(select(j,:), ds(j,:))];%create note matrix of 1 row
            end
    end%end switch case for attribute formation
end% end for 'i'
%____________________TAKE INPUT FROM USER____________________%
prompt = 'Note : ';
while 1
    in = input(prompt);
    switch in
        case 1
            sound(x1, S);
        case 2
            sound(x2, S);
        case 3
            sound(x3, S);
        case 4
            sound(x4, S);
        case 5
            sound(x5, S);
        case 6
            sound(x6, S);
        otherwise
            disp('Wrong Note')
    end
end