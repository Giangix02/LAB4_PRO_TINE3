clear all
close all

% solver
circuit.magcadImporter = 0; % 0 Matlab, 1 Magcad 

%molecule
circuit.molecule = 'bisfe_4';

%Intermolecular distance
circuit.dist_z = 10;

%layout (Layout Generator)
circuit.structure = {'Dr1' '1' '1' '1' '1' '1' '1' '1' '1' '2' '2' '2' '2' '2' '2' '2' '2' '3' '3' '3' '3' '3' '3' '3' '3'};
 
%drivers
circuit.Values_Dr = {
    'Dr1'   +4.5 +4.5 +4.5 
};

%clock
circuit.stack_phase(1,:) = [+0.1  +0.1 +0.1 ];
circuit.stack_phase(2,:) = [-0.1  +0.1 +0.1 ];
circuit.stack_phase(3,:) = [-0.1  -0.1 +0.1 ];



%RunTime Plot
%settings.plotIntermediateSteps = 1;
settings.verbosity = 2;

%Viewer settings
plotSettings.plot_1DCharge = 1;
plotSettings.plot_potential = 1;

%paths
settings.out_path = pwd;
plotSettings.out_path = settings.out_path;

%%%%
this_path = pwd;
scerpa_path = 'scerpa/';
cd(scerpa_path)
generation_status = SCERPA('generateLaunch', circuit, settings);
                    SCERPA('plotSteps', plotSettings);
cd(this_path)