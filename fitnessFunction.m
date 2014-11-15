function [ fitnessArray ] = fitnessFunction( population, size, initCash, stockData, N )
     fitnessArray = zeros(6, size);
     for i = 1 : size
        fitnessArray(1, i) = i; %holds the index
        results = evaluateFitness( population (:,:,i), initCash, stockData, N);
				fitnessArray(2, i) = results(1); %totalProfit
				fitnessArray(3, i) = results(2); %winningCount
				fitnessArray(4, i) = results(3); %winRate
				fitnessArray(5, i) = results(4); %totalProfitRate
				fitnessArray(6, i) = results(5); %averageProfitRate

     end
end

function [ totalProfit, winningCount, winRate, totalProfitRate, averageProfitRate ] = evaluateFitness(chromosome, initCash, stockData, N )

	totalProfit = 0;
	totalProfitRate = 0;
	winningCount = 0;

	for i = 1 : N %loop through dataset with each chromosome
		buyPrice = stockData(4); %selling
		sellPrice = stockData(5); %buying
		tradeCount = stockData(6);

		%profit(i) = sellPrice(i) - buyPrice(i
		profit =  sellPrice - buyPrice;

		%TP = sum of the profit for the total trade count(N)

		totalProfit = totalProfit + profit;

		%PR(i) = profit(i)/buyPrice(i)
		profitRate = profit / buyPrice;

		%TPR
		totalProfitRate = totalProfitRate + profitRate;

		% -------these are not included in the fitness function definition--------

		%WCT = for all (i), if (profit(i)>0), count++; WCT = count;

		if ( profit > 0)
			winningCount = winningCount + 1;
	end

	winRate = winningCount / N;
	averageProfitRate = totalProfitRate / N;

end;
