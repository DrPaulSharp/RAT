function [output,sRough] = callMatlabCustomLayers(params,contrast,funcName,path,bulkIn,bulkOut)

persistent fileHandle


if coder.target('MATLAB')

    if isempty(fileHandle)
    % Make the fileHandle on the first pass through the function only
    % for performance
        fileHandle = str2func(funcName);
    end

    [output,sRough] = fileHandle(params,bulkIn,bulkOut,contrast);
    
else
    
    % Use a coder.extrinsic call here. There is no need to explicitly
    % define the 'coder.extrinsic' call, as Coder will automatically
    % pass the excecution of the function back to the calling Matlab 
    % session when it encountes feval in a function to be generated.
    
    % Ultimately, we will replace this with a C++ class calling a 
    % separate Matlab engine so that Matlab custom model functions are 
    % still usable when the generated code is used from Python.
    % https://www.mathworks.com/help/matlab/calling-matlab-engine-from-cpp-programs.html
    
    % Pre-define the outputs to keep the compiler happy
    % Need to define the size of the outputs with coder preprocessor
    % directives
    
    % Fix variable types by defining example values
    output = [0 0 0];
    sRough = 3;
    
    % Then define sizes..
    coder.varsize('output',[1000 7],[1 1]);
    coder.varsize('sRough',[1 1],[0 0]);
    
    % feval the function (automatically passed back to Matlab)
    [output,sRough] = feval(funcName,params,bulkIn,bulkOut,contrast);

end