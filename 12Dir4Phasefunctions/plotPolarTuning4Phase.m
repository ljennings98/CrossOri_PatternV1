% Input arguments from function *getAlignedGratPlaidTuning.m*
% where both grating and plaid tuning curves are aligned to "preferred"
% grating

function plotPolarTuning4Phase(gratAligned, plaidAligned, iCell, plot_type)
    
    if nargin < 4
        plot_type = '';
    end

    x       = -150:30:180;
    x_rad   = deg2rad(x);

    colors = getColors;

    if strcmp(plot_type, 'separate') %this just allows us to either plot the responses separately or together on the same figure
        figure(555+iCell)
        for im = 1:4
            subplot(1,4, im)
            polarplot([x_rad x_rad(1)], [plaidAligned(iCell,:,im) plaidAligned(iCell,1,im)],'Color',colors(im,:), 'LineWidth',3.5)
            hold on
            polarplot([x_rad x_rad(1)], [gratAligned(iCell,:) gratAligned(iCell,1)],'k', 'LineWidth',3.5)
        end
    else
        for im = 1:4
            polarplot([x_rad x_rad(1)], [plaidAligned(iCell,:,im) plaidAligned(iCell,1,im)],'Color',colors(im,:), 'LineWidth',3.5)
            hold on
        end
        polarplot([x_rad x_rad(1)], [gratAligned(iCell,:) gratAligned(iCell,1)],'k', 'LineWidth',3.5)
    end
end