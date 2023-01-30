function predictAllRF(pathRF)

startpath = pwd;

cd(pathRF), load('training'), load('testing')
nameOutcomes = fieldnames(training.outcomes); nOutcomes = numel(nameOutcomes);
%fSetNames = fieldnames(training.textures.(nameOutcomes{1})); nFset = numel(fSetNames);
fSetNames = {'PET','CT','PETCT'}; nFset = numel(fSetNames); % TESTING PET radiomics models, CT radiomics models, and PET radiomics models + CT radiomics models, as organized in organizeRFexperiments.m

for o = 1:nOutcomes
    if strcmp(nameOutcomes{o},'DeathSign')
        outcome = testing.outcomes.Death;
        time = testing.timeToEvents.Death;
    else
        outcome = testing.outcomes.(nameOutcomes{o});
        time = testing.timeToEvents.(nameOutcomes{o});
    end
    censoring = 1 - outcome;
    for f = 1:nFset
        results = struct;
        RF = load(['RF_',fSetNames{f},'_',nameOutcomes{o}]); RF = struct2cell(RF); RF = RF{1};
        indClinic = training.clinical.bestAdd.(nameOutcomes{o}).(fSetNames{f});
        text = testing.textures.(nameOutcomes{o}).(fSetNames{f}); nText = size(text,2);
        tableTest = [text,testing.clinical.table(:,indClinic)];
        [prob] = predictRF(tableTest,RF);
        results.probResponse = prob;
        [AUC,sensitivity,specificity,accuracy] = calcPerformMetrics(prob,outcome,0.5);
        CI = calcCI(prob,time,censoring);
        results.AUC = AUC; results.Sensitivity = sensitivity; results.Specificity = specificity; results.Accuracy = accuracy;
        results.CI = CI;
        save(['testResultsRF_',(fSetNames{f}),'_',nameOutcomes{o}],'results'), clear results
    end
end

cd(startpath)
end