#https://leetcode.com/problems/unique-paths-ii/

# @param {Integer[][]} obstacle_grid
# @return {Integer}
# Runtime: 60 ms, faster than 50.00% of Ruby online submissions for Unique Paths II.
# Memory Usage: 210.1 MB, less than 29.17% of Ruby online submissions for Unique Paths II.

def unique_paths_with_obstacles(obstacle_grid)
   # puts obstacle_grid.inspect
    @path = {}
    @rows = obstacle_grid&.count || 0
    @columns = obstacle_grid.first&.count || 0
    
    return 0 if @rows < 1 || @columns < 1 || obstacle_grid[0][0] == 1 || obstacle_grid.last.last == 1
    
    r = move(obstacle_grid, 0,0)
  #  puts @path.inspect
    r
end

def move(obstacle_grid, m,n)
    return if @path["#{m}-#{n}"]
    
    if m == @rows -1 && n == @columns -1
      @path["#{m}-#{n}"] = 1 
    else
     # m + 1, n , down
     down = 0
     right = 0
     if m + 1 <  @rows && obstacle_grid[m+1][n] ==0
        down = @path["#{m+1}-#{n}"] || move(obstacle_grid, m+1, n)
     end

     # m, n + 1, right
     if n + 1 < @columns && obstacle_grid[m][n+ 1] == 0
        right = @path["#{m}-#{n+1}"] || move(obstacle_grid,m,n+1)
     end

     @path["#{m}-#{n}"] = down + right
    end    
end