%% INIT FOLDER STRUCTURE
% Clear workspace and restore default path to prevent reaching the files in
% other folders with the same structure.
clear all; clc;
% restoredefaultpath

% Add current folder structure into path.
addpath('../initvars/', '../kinematics/', '../dataset/', '../')

%% SET SIMULINK BEHAVIOR
tg = slrt;
tg.CommunicationTimeOut = 20;

% Redirect all Simulink outputs (cache, generated codes and files) into the
% subfolder ./outfolder:
% Get the current configuration.
cfg = Simulink.fileGenControl('getConfig');
% Set the folders of several output types.
cfg.CacheFolder = fullfile('./outfolder');
cfg.CodeGenFolder = fullfile('./outfolder');
cfg.CodeGenFolderStructure = 'TargetEnvironmentSubfolder';
% Apply the settings.
Simulink.fileGenControl('setConfig', 'config', cfg);
clear('cfg');

%% INITIALIZE SIMULATION DATA
load busobjects.mat
