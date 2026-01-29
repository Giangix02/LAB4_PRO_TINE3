%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%       Self-Consistent Electrostatic Potential Algorithm (SCERPA)         %
%                                                                          %
%       VLSI Nanocomputing Research Group                                  %
%       Dept. of Electronics and Telecommunications                        %
%       Politecnico di Torino, Turin, Italy                                %
%                                                                          %
%       People [people you may contact for info]                           %
%         Yuri Ardesi (yuri.ardesi@polito.it)                              %
%         Giuliana Beretta (giuliana.beretta@polito.it)                    %
%                                                                          %
%       Supervision: Gianluca Piccinini, Mariagrazia Graziano              %
%                                                                          %
%       Relevant pubblications doi: 10.1109/TCAD.2019.2960360              %
%                                   10.1109/TVLSI.2020.3045198             %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%distances
dist_z = 10;   

%molecule
molecule = 'bisfe_4';

%layout
QCA_circuit_layout = { 'Dr1' 'Dr2' '1' '1' '1' '1' ; 
                       'Dr1' 'Dr2' '1' '1' '1' '1'};     
%molecule rotation
QCA_circuit_rotation_x = { '0' '0' '0' '0' '0' '0' ; 
                           '0' '0' '0' '0' '0' '0' };    

%molecule shift on x
QCA_circuit_shift_x = { '0' '0' '0' '0' '0' '0' ; 
                           '0' '0' '0' '0' '0' '0' };                      

%molecule shift on y
QCA_circuit_shift_y = { '0' '0' '0' '0' '0' '0' ; 
                        '0' '0' '50' '0' '0' '0' };   

%molecule shift on z
QCA_circuit_shift_z = { '0' '0' '0' '0' '0' '0' ; 
                        '0' '0' '0' '0' '0' '0' };   
                    
%drivers and clock
Values_Dr = {
    'Dr1' -4.5 +4.5 'end';
    'Dr2' +4.5 -4.5 'end'};

%clock
stack_phase(1,:) = [2 2];


          

