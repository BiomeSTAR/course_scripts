%% Matlab script to analyze and visualize clinical trials data

% Read and store spreadsheet data as a structure
ClinicalTrialsResults = table2struct( readtable('data.xlsx'));

%Extract phases:
Phases = categorical([ClinicalTrialsResults.Phase]);
PhasesCategories = unique(Phases);


subplot(2,2,1)
%Extract Therapy Mechanism:
Mechanism = categorical({ClinicalTrialsResults.TherapyMechanisms});
MechanismCategories = unique(Mechanism);
hpMech = histogram(Mechanism, MechanismCategories);
title('Therapy Mechanism');

subplot(2,2,2)
%Extract Delivery Route:
Mechanism = categorical({ClinicalTrialsResults.DeliveryRoute});
MechanismCategories = unique(Mechanism);
hpDR = histogram(Mechanism, MechanismCategories);
title('Delivery Route');


subplot(2,2,3)
%Extract Delivery Vehicle:
Mechanism = categorical({ClinicalTrialsResults.DeliveryVehicle});
MechanismCategories = unique(Mechanism);
hpDV = histogram(Mechanism, MechanismCategories);
title('Delivery Vehicle');

subplot(2,2,4)
%Extract Outcome Measures:
Mechanism = categorical({ClinicalTrialsResults.OutcomeMeasures});
MechanismCategories = unique(Mechanism);
hpOM = histogram(Mechanism, MechanismCategories);
title('Outcome Measures');


%% Function to change appearance of graphs
handles = {hpMech; hpDR; hpDV; hpOM};
for i = 1:4
    subplot(2,2,i)
    set(gca, 'FontSize', 14, 'LineWidth', 1.4)
    axis square
    handles{i}.BarWidth = handles{i}.BarWidth*0.75;
    ylim(round(ylim*1.2))
end
