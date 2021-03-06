function [e00, e14] = importfile1(filename, dataLines)
%IMPORTFILE1 Import data from a text file
%  [E00, E14] = IMPORTFILE1(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as column vectors.
%
%  [E00, E14] = IMPORTFILE1(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  [e00, e14] = importfile1("C:\Users\tjagielski\Documents\Projects\School\Sophomore - Semester 2\Circuits\Labs\Lab 5\LTspice\Simulation Results\Experiment1_nmos.txt", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 27-Mar-2020 08:02:23

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Setup the Import Options
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["e00", "e14"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable(filename, opts);

%% Convert to output type
e00 = tbl.e00;
e14 = tbl.e14;
end