% FEM Code for 2D Truss
% clear memory
clear;
% clear screen
clc;
%==========================================================================
% Open input file for reading data
finput = fopen('input.txt');

% read total number of nodes
nnode = fscanf(finput,'%d',[1]);

% read nodal coordinates
for i=1:nnode
    node_coor(i,:) = fscanf(finput,'%f %f',[2]);
end

% read total number of elements
nelem = fscanf(finput,'%d',[1]);
% read element data: node1, node2, A, E
for i=1:nelem
    elemdata(i,:) = fscanf(finput,'%d %d %f %f',[4]);
end

% read total number of forces applied on structure
nforce = fscanf(finput,'%d',[1]);
% read force data: node#, component, force value
for i=1:nforce
    forcedata(i,:) = fscanf(finput,'%d %d %f',[3]);
end

% read total number of prescribed displacements
ndisp = fscanf(finput,'%d',[1]);
% read prescribed data: node#, component, value
for i=1:ndisp
    dispdata(i,:) = fscanf(finput,'%d %d %f',[3]);
end

%Close the input file
fclose(finput);

%==========================================================================