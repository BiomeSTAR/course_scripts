%% Matlab script to analyze and visualize clinical trials data

% Read and store spreadsheet data as a structure
 ClinicalTrialsResults = table2struct( readtable('SampleData_2.xlsx'));

%Extract phases:
Phases = categorical([ClinicalTrialsResults.Phase]);
PhasesCategories = unique(Phases);


subplot(2,2,1)
%Extract Therapy Mechanism:
Mechanism = categorical({ClinicalTrialsResults.TherapyMechanisms});
MechanismCategories = unique(Mechanism);
hpMech = plotStackedBars(Mechanism, MechanismCategories, Phases, PhasesCategories);
title('Therapy Mechanism');




subplot(2,2,2)
%Extract Delivery Route:
DeliveryRoute = categorical({ClinicalTrialsResults.DeliveryRoute});
DeliveryRouteCategories = unique(DeliveryRoute);
hpDR = plotStackedBars(DeliveryRoute, DeliveryRouteCategories, Phases, PhasesCategories);
title('Delivery Route');


subplot(2,2,3)
%Extract Delivery Vehicle:
DeliveryVehicle = categorical({ClinicalTrialsResults.DeliveryVehicle});
DeliveryVehicleCategories = unique(DeliveryVehicle);
hpDV = plotStackedBars(DeliveryVehicle, DeliveryVehicleCategories, Phases, PhasesCategories);
title('Delivery Vehicle');

subplot(2,2,4)
%Extract Outcome Measures:
OutcomeMeasures = categorical({ClinicalTrialsResults.OutcomeMeasures});
OutcomeMeasuresCategories = unique(OutcomeMeasures);
hpOM = plotStackedBars(OutcomeMeasures, OutcomeMeasuresCategories, Phases, PhasesCategories);
title('Outcome Measures');


handles = {hpMech; hpDR; hpDV; hpOM};
% Add a legend
hleg = legend("  Phase " + string(PhasesCategories));
set(hleg,'FontSize',16,'box','off', 'Position', [0.4219    0.4870    0.1990    0.1203]);

%% Change appearance of graphs
for i = 1:4
    subplot(2,2,i)
    set(gca, 'FontSize', 14, 'LineWidth', 1.4)
    ylabel('No. of Trials', 'FontSize',16);
    axis square
   %handles{i}.BarWidth = handles{i}.BarWidth*0.75;
    ax1 = gca;
    if i<3
    ax1.InnerPosition = [ax1.InnerPosition(1), ax1.InnerPosition(2), ax1.InnerPosition(3)*1, ax1.InnerPosition(4)*1];
    else
    ax1.InnerPosition = [ax1.InnerPosition(1), ax1.InnerPosition(2), ax1.InnerPosition(3)*1, ax1.InnerPosition(4)*1];
    end

    ylim(round(ylim*1.2))
end


%% Function to plot stacked bar graphs
function hstack = plotStackedBars(Type, TypeCategories, Phases, PhasesCategories)
%Stacked bar graph
    phaseBreakup = zeros(length(TypeCategories), length(PhasesCategories));
    %Extract Data
    for i = 1:length(unique(Type))
        idx = find(Type == TypeCategories(i));
        phaseBreakup(i,:) = histcounts(Phases(idx),PhasesCategories);
    end

    % Plot bar graph data
    hstack = bar(TypeCategories, phaseBreakup, 0.5, 'stack','FaceColor','flat');
    %Stack colors
    jtcolor={        [0.33    0.33    0.33],...
                      [255,128,128]/255, [144,190,248]/255, [128,255,128]/255,...
                   };
    for i = 1:length(PhasesCategories)
    hstack(i).CData = [jtcolor{i}];
    end
    xticklabels()
end
