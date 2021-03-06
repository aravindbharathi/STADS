function [sm_TM_SNT] = sm_TM_gnrt_SNT (sm_TM_SNT_R, is_degree, sm_GD_SC, sm_PP_SC)
%% Generates the Star Neighbourhood Matrix for Tracking Mode Algorithm. 
% Parameters 
% ---------------
% sm_TM_SNT_R : double
%     The radius used to construct the SNT. 
% is_degree : Boolean
%     If true -> Implies the radius is in degrees. 
% load the guide star and the preprocessed catalogues. 

% Returns: 
% ---------------
% sm_TM_SNT : (5060, N) - Matrix
%     The Star Neighbourhood Matrix 
%% Code
%% Initialise SNT
sm_TM_SNT = [];

%% Construct SNT
for sm_star_ID = 1:size(sm_GD_SC, 1)
    % Find Neighbour stars for each guide star
    sm_TM_SNT_star_ID = sm_TM_SNT_neighbours(sm_star_ID, sm_PP_SC, sm_TM_SNT_R, is_degree);
    % Add padding to SNT_star_ID
    sm_TM_SNT = sm_TM_SNT_padding(sm_TM_SNT_star_ID, sm_TM_SNT);
end
end
