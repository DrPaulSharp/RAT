% This is a helper function to make the inputs and outputs for the Unit
% Tests. When changes are made to projectClass and controlsClass, it is
% necessary to run this function so that the changes (i.e. number of
% fields) are set in inputs and outputs to the tests.

%% 1. Standard Layers
% (a) Inputs
root = getappdata(0,'root');
standardProblem = domainsStandardLayers();
controlsInput = controlsClass();

% Supress printing of RAT output for testing
controlsInput.display = 'off';

[problemStruct,problemCells,problemLimits,priors,controls] = parseClassToStructs(standardProblem,controlsInput);

inputs.project = standardProblem;
inputs.problemStruct = problemStruct;
inputs.problemCells = problemCells;
inputs.problemLimits = problemLimits;
inputs.priors = priors;
inputs.controlsInput = controlsInput;
inputs.controls = controls;

save([root filesep 'tests/domainsTFReflectivityCalculation/domainsStandardLayersInputs'],'inputs');

% (b) Outputs
resultStruct = reflectivityCalculation(problemStruct,problemCells,problemLimits,controls);

outputs.resultStruct = resultStruct;

[problemStruct,resultStructMain,bayesResults] = RATMain(problemStruct,problemCells,problemLimits,controls,priors);

outputs.problemStruct = problemStruct;
outputs.resultStructMain = resultStructMain;
outputs.bayesResults = bayesResults;

[project, result] = RAT(standardProblem,controlsInput);

outputs.project = project;
outputs.result = result;

save([root filesep 'tests/domainsTFReflectivityCalculation/domainsStandardLayersOutputs'],'outputs');

% (c) TF Parameters
[contrastParams,calculationResults,reflectivity,simulation,shiftedData,layerSlds,sldProfiles,resampledLayers] = domainsTF.reflectivityCalculation(problemStruct,problemCells,controls);

TFParams.contrastParams = contrastParams;
TFParams.calculationResults = calculationResults;
TFParams.reflectivity = reflectivity;
TFParams.simulation = simulation;
TFParams.shiftedData = shiftedData;
TFParams.layerSlds = layerSlds;
TFParams.sldProfiles = sldProfiles;
TFParams.resampledLayers = resampledLayers;

[backgroundParams,qzshifts,scalefactors,bulkIn,bulkOut,resolutionParams,...
 chis,reflectivity,simulation,shiftedData,layerSlds,sldProfiles,...
 resampledLayers,subRoughs] = domainsTF.standardLayers(problemStruct,problemCells,controls);

TFParams.backgroundParams = backgroundParams;
TFParams.qzshifts = qzshifts;
TFParams.scalefactors = scalefactors;
TFParams.bulkIn = bulkIn;
TFParams.bulkOut = bulkOut;
TFParams.resolutionParams = resolutionParams;
TFParams.chis = chis;
TFParams.subRoughs = subRoughs;

save([root filesep 'tests/domainsTFReflectivityCalculation/domainsStandardLayersTFParams'],'TFParams');

%% 2. Custom XY.
% (a) Inputs
customXYProblem = domainsCustomXY();
controlsInput = controlsClass();

% Supress printing of RAT output for testing
controlsInput.display = 'off';

[problemStruct,problemCells,problemLimits,priors,controls] = parseClassToStructs(customXYProblem,controlsInput);

inputs.project = customXYProblem;
inputs.problemStruct = problemStruct;
inputs.problemCells = problemCells;
inputs.problemLimits = problemLimits;
inputs.priors = priors;
inputs.controlsInput = controlsInput;
inputs.controls = controls;

save([root filesep 'tests/domainsTFReflectivityCalculation/domainsCustomXYInputs'],'inputs');

% (b) Outputs
resultStruct = reflectivityCalculation(problemStruct,problemCells,problemLimits,controls);

outputs.resultStruct = resultStruct;

[problemStruct,resultStructMain,bayesResults] = RATMain(problemStruct,problemCells,problemLimits,controls,priors);

outputs.problemStruct = problemStruct;
outputs.resultStructMain = resultStructMain;
outputs.bayesResults = bayesResults;

[project, result] = RAT(customXYProblem,controlsInput);

outputs.project = project;
outputs.result = result;

save([root filesep 'tests/domainsTFReflectivityCalculation/domainsCustomXYOutputs'],'outputs');

% (c) TF Parameters
[contrastParams,calculationResults,reflectivity,simulation,shiftedData,layerSlds,sldProfiles,resampledLayers] = domainsTF.reflectivityCalculation(problemStruct,problemCells,controls);

TFParams.contrastParams = contrastParams;
TFParams.calculationResults = calculationResults;
TFParams.reflectivity = reflectivity;
TFParams.simulation = simulation;
TFParams.shiftedData = shiftedData;
TFParams.layerSlds = layerSlds;
TFParams.sldProfiles = sldProfiles;
TFParams.resampledLayers = resampledLayers;

[backgroundParams,qzshifts,scalefactors,bulkIn,bulkOut,resolutionParams,...
 chis,reflectivity,simulation,shiftedData,layerSlds,sldProfiles,...
 resampledLayers,subRoughs] = domainsTF.customXY(problemStruct,problemCells,controls);

TFParams.backgroundParams = backgroundParams;
TFParams.qzshifts = qzshifts;
TFParams.scalefactors = scalefactors;
TFParams.bulkIn = bulkIn;
TFParams.bulkOut = bulkOut;
TFParams.resolutionParams = resolutionParams;
TFParams.chis = chis;
TFParams.subRoughs = subRoughs;

save([root filesep 'tests/domainsTFReflectivityCalculation/domainsCustomXYTFParams'],'TFParams');

%% 3. Custom Layers.
customLayersProblem = domainsCustomLayers();
controlsInput = controlsClass();

% Supress printing of RAT output for testing
controlsInput.display = 'off';

[problemStruct,problemCells,problemLimits,priors,controls] = parseClassToStructs(customLayersProblem,controlsInput);

inputs.project = customLayersProblem;
inputs.problemStruct = problemStruct;
inputs.problemCells = problemCells;
inputs.problemLimits = problemLimits;
inputs.priors = priors;
inputs.controlsInput = controlsInput;
inputs.controls = controls;

save([root filesep 'tests/domainsTFReflectivityCalculation/domainsCustomLayersInputs'],'inputs');

% (b) Outputs
resultStruct = reflectivityCalculation(problemStruct,problemCells,problemLimits,controls);

outputs.resultStruct = resultStruct;

[problemStruct,resultStructMain,bayesResults] = RATMain(problemStruct,problemCells,problemLimits,controls,priors);

outputs.problemStruct = problemStruct;
outputs.resultStructMain = resultStructMain;
outputs.bayesResults = bayesResults;

[project, result] = RAT(customLayersProblem,controlsInput);

outputs.project = project;
outputs.result = result;

save([root filesep 'tests/domainsTFReflectivityCalculation/domainsCustomLayersOutputs'],'outputs');

% (c) TF Parameters
[contrastParams,calculationResults,reflectivity,simulation,shiftedData,layerSlds,sldProfiles,resampledLayers] = domainsTF.reflectivityCalculation(problemStruct,problemCells,controls);

TFParams.contrastParams = contrastParams;
TFParams.calculationResults = calculationResults;
TFParams.reflectivity = reflectivity;
TFParams.simulation = simulation;
TFParams.shiftedData = shiftedData;
TFParams.layerSlds = layerSlds;
TFParams.sldProfiles = sldProfiles;
TFParams.resampledLayers = resampledLayers;

[backgroundParams,qzshifts,scalefactors,bulkIn,bulkOut,resolutionParams,...
 chis,reflectivity,simulation,shiftedData,layerSlds,sldProfiles,...
 resampledLayers,subRoughs] = domainsTF.customLayers(problemStruct,problemCells,controls);

TFParams.backgrounds = backgroundParams;
TFParams.qzshifts = qzshifts;
TFParams.scalefactors = scalefactors;
TFParams.bulkIn = bulkIn;
TFParams.bulkOut = bulkOut;
TFParams.resolutionParams = resolutionParams;
TFParams.chis = chis;
TFParams.subRoughs = subRoughs;

save([root filesep 'tests/domainsTFReflectivityCalculation/domainsCustomLayersTFParams'],'TFParams');
