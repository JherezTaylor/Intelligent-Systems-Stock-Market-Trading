function[totalProfit, winningCount, winRate, totalProfitRates, averageProfitRate] = fitness(i)

	sellprice = i(4);
	buyprice = i(5);
	tradeCount = i(6); %(N)

	%profit(i) = sellprice(i) - buyprice(i)
	profit = sellprice - buyprice;

	%TP = sum of the profit for the total trade count(N) 
	% since the values of the sell and buy price for the particular i does not vary, a sum of operation is not required
	% instead just mutiply by N since the value is constant i.e. profit(i) needs to be calculated once
	totalProfit = profit * tradeCount;

	% PR(i) = profit(i)/buyprice(i)
	profitRate = profit / buyprice;

	%TPR
	% since summation is being performed, multipling by N would suffice
	totalProfitRates = profitRate * tradeCount;

	% -------these are not included in the fitness function definition--------

	%WCT = for all (i), if (profit(i)>0), count++; WCT = count;
	% this makes no sense as the values in (i) do not change so if profit is +ve then WCT = N
	% else WCT = 0; which is odd 
	if (profit>0)
		winningCount = N;
	else
		winningCount = 0;

	%WRT = WCT/N
	% this will end up being either 1 or 0 depending on the profit being negative or positive
	winRate = winningCount / tradeCount;

	%APR = TPR/N
	averageProfitRate = totalProfitRates / tradeCount;
end;