clear all
close all


for i = -5:1:5
    for j = -5:1:5
% solver
circuit.magcadImporter = 0; % 0 Matlab, 1 Magcad 

%molecule
circuit.molecule = 'bisfe_4';

%Intermolecular distance
circuit.dist_z = 9;

%layout (Layout Generator)
circuit.structure = {0      0     0      0    0    0    0    0  '1'   '1'   0   0   0   0   0   0;
                     0      0     0      0    0    0    0    0  '1'   '1'   0   0   0   0   0   0;
                     0      0     0      0    0    0    0    0  '1'   '1'   0   0   0   0   0   0;
                     'Dr1' 'Dr2' '1'   '1'   '1'  '1'  '1'  '1' '1'   '1'  '1' '1' '1' '1' '1' '1';
                     0      0     0      0    0    0    0    0  '1'   '1'   0   0   0   0   0   0;
                     0      0     0      0    0    0    0    0  '1'   '1'   0   0   0   0   0   0;
                     0      0     0      0    0    0    0    0  '1'   '1'   0   0   0   0   0   0;
};

circuit.rotation_y = [0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
];

circuit.rotation_z = [0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   i    j   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
                      0    0    0    0    0    0    0    0   0    0   0    0    0    0    0    0;
];

%drivers
circuit.Values_Dr = {
    'Dr1'   -4.5 
    'Dr2'   +4.5
};

%clock
circuit.stack_phase(1,:) = [+2];


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
cd("SCERPA_OUTPUT_FILES")

%voglio copiare il contenuto della cartella "SCERPA_OUTPUT_FILES/figures"
%e metterla in un'altra cartella nominata: angle_same_dir_i 
%con i il parametro del for

% 1. Definisci il nome della cartella sorgente
sorgente = 'figures';

% 2. Crea il nome parametrico usando la i del ciclo for
% Usiamo num2str o sprintf. 
% Se i è negativo, MATLAB gestirà correttamente il segno "-" nel nome.
nome_destinazione = sprintf('Moll7_a%d__Mol8_a%d', i,j);

% 3. Torna indietro di un livello se vuoi creare la cartella fuori 
% da SCERPA_OUTPUT_FILES, oppure rimani lì.
% Esempio: creiamo la cartella allo stesso livello di SCERPA_OUTPUT_FILES
cd(this_path) 

% 4. Copia la cartella
% Nota: fullfile aiuta a costruire i percorsi correttamente
cartella_da_copiare = fullfile(this_path, 'SCERPA_OUTPUT_FILES', 'figures');

if exist(cartella_da_copiare, 'dir')
    [stato, msg] = copyfile(cartella_da_copiare, nome_destinazione);
    if stato
        fprintf('Copia completata per i = %d nella cartella %s\n', i, nome_destinazione);
    else
        fprintf('Errore copia per i = %d: %s\n', i, msg);
    end
else
    fprintf('Attenzione: la cartella sorgente per i = %d non esiste.\n', i);
end

% Torna alla cartella base per il prossimo ciclo i
cd(this_path)

     end % fine del ciclo for j
end % fine del ciclo for i
