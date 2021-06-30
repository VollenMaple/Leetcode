#https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
# @param {Integer[]} prices
# @return {Integer}

#test case [7,6,5,4,3,2,1]  0
# [7,1,5,3,6,4] 5
#Runtime: 172 ms, faster than 28.49% of Ruby online submissions for Best Time to Buy and Sell Stock.
#Memory Usage: 219.5 MB, less than 93.31% of Ruby online submissions for Best Time to Buy and Sell Stock.

def max_profit(prices)
  len = prices.count

  @profits = 0
  @biggest_number = prices.last
 
  i = len - 2

  while i > -1  
     caculate(prices, i)
     i = i - 1
  end   

  @profits
end

def caculate(prices, i)
  if prices[i] >= prices[i+1]
      @biggest_number = prices[i] if  @biggest_number  < prices[i] 
  else
    if @biggest_number - prices[i] > @profits
        @profits = @biggest_number - prices[i]
     end
  end  
end  