clear all


% solver
circuit.magcadImporter = 0; % 0 Matlab, 1 Magcad 

%molecule
circuit.molecule = 'bisfe_4';

%Intermolecular distance
circuit.dist_z = 9;
circuit.dist_y = 20;

%layout (Layout Generator)
circuit.structure = {0      0        0     0    0   0  '1' '1' '2' '2' '2' '2' 0   0   0   0    0   0 ;
                     'Dr1' 'Dr2'    '1'   '1'  '1' '1' '1' '1'  0   0   0   0 '3' '3' '3' '3'  '3' '3';
                     0      0        0     0    0   0  '1' '1' '2' '2' '2' '2' 0   0   0   0    0   0 ;
};



 
%drivers
circuit.Values_Dr = {
    'Dr1'   -4.5 -4.5 -4.5
    'Dr2'   +4.5 +4.5 +4.5
};

circuit.clockMode = 'map';

%clock

rawMatrix_efield_phase1 = readmatrix("phase1.csv");
rawMatrix_efield_phase2 = readmatrix("phase2.csv");
rawMatrix_efield_phase3 = readmatrix("phase3.csv");
% circuit.stack_phase(1,:) = [+2 +2 +2];
% circuit.stack_phase(2,:) = [-2 +2 +2];
% circuit.stack_phase(3,:) = [-2 -2 +2];

circuit.ckmap.coords = [rawMatrix_efield_phase1(:,1)*10  rawMatrix_efield_phase1(:,2)*10]; %*10 to convert from nm to Angstrom
circuit.ckmap.field = 1e-9*[rawMatrix_efield_phase1(:,4) rawMatrix_efield_phase2(:,4) rawMatrix_efield_phase3(:,4)];


%RunTime Plot
settings.verbosity = 2;

%Convergence settings
settings.damping = 0.4;

%Viewer settings
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