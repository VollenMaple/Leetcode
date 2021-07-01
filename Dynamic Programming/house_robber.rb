#https://leetcode.com/problems/house-robber/submissions/

# @param {Integer[]} nums
# @return {Integer}
#Runtime: 44 ms, faster than 94.55% of Ruby online submissions for House Robber.
#Memory Usage: 209.8 MB, less than 37.27% of Ruby online submissions for House Robber.

def rob(nums)
    @sum = Array.new(nums.count, 0)
    
    i = 0
    while i < nums.count
        process(nums,i)
        i = i + 1
    end
    
    @sum.last
end

def process(nums, i)
    if i == 0
        @sum[0] = nums[0]
    elsif i == 1
        @sum[1] = nums[0] > nums[1] ? nums[0] : nums[1]
    else
       @sum[i] = nums[i] + @sum[i-2] >  @sum[i-1] ? nums[i] + @sum[i-2] : @sum[i-1] 
    end    
end