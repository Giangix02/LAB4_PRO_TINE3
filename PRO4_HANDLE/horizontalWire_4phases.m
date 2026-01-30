clear all
close all

% solver
circuit.magcadImporter = 0; % 0 Matlab, 1 Magcad 

%molecule
circuit.molecule = 'bisfe_4';

%Intermolecular distance
circuit.dist_z = 9;

%layout (Layout Generator)
circuit.structure = {'Dr2' 'Dr1' '1' '1' '1' '1' '1' '1' '1' '1' '2' '2' '2' '2' '2' '2' '2' '2' '3' '3' '3' '3' '3' '3' '3' '3'};
 
%drivers
circuit.Values_Dr = {
    'Dr2'   +4.5 +4.5 +4.5
    'Dr1'   -4.5 -4.5 -4.5
};

%clock

%se clockMode = map, allora non devo fare circuit.stack_phase
circuit.clockMode = 'map';

%il file di COMSOL mi fornisce per ogni riga: [x y z Efield]
 rawMatrix_efield_phase1 = readmatrix("dataset_slice_xy_efield_phase1.csv");
 rawMatrix_efield_phase2 = readmatrix("dataset_slice_xy_efield_phase2.csv");
 rawMatrix_efield_phase3 = readmatrix("dataset_slice_xy_efield_phase3.csv");


%per x_COMSOL = z_SCERPA


%circuit.ckmap.coords(z y)--> z = prima colonna di rawMatrix, y = seconda
%colonna di rawMatrix
 circuit.ckmap.coords = [rawMatrix_efield_phase1(:,1)*10-10  rawMatrix_efield_phase1(:,2)*10 - 4.5 ];
 circuit.ckmap.field = 1e-9*[rawMatrix_efield_phase1(:,4) rawMatrix_efield_phase2(:,4) rawMatrix_efield_phase3(:,4)];


% circuit.stack_phase(1,:) = [+2  +2  +2 ];
% circuit.stack_phase(2,:) = [-2  +2  +2 ];
% circuit.stack_phase(3,:) = [-2  -2  +2 ];



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