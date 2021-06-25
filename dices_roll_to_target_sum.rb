# https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/submissions/

# @param {Integer} d, how many dices, d>=1
# @param {Integer} f, how many faces, f<= 30
# @param {Integer} target, target number, 1 <= target <= 1000
# @return {Integer}
def num_rolls_to_target_recursive_no_recursive(d, f, target)
    puts "d #{d}, f #{f}, target #{target}"
    if target < d || target > d * f
        return 0
    elsif target == d || target == d * f
        return 1
    end    
    
    dices = {}
    [*1..d].each { |i|  dices[i] = [*1..f] }
    
    faces = []
    [*1..d].each {|i|  faces << 0}
    
    count = 0
    while faces.select{|i| i == f -1 }.count < d
       t = 0
       faces.each_with_index do |face_index,dice_index|
           t = t + dices[dice_index+1][face_index]
       end
        
       count = count + 1 if t == target 
        
       faces.each_with_index do |face_index, dice_index|
          if faces[dice_index] < f -1
            faces[dice_index] = faces[dice_index] +1
            break
          elsif faces[dice_index] == f-1
            faces[dice_index] = 0
            next
          end
       end    
    end    
    
    count
end

def num_rolls_to_target_recursive(d, f, target)
   puts "d #{d} -- f #{f} -- target #{target}"
    if d == 1
      return f >= target ? 1 : 0
    else
       count = 0
       [*1..f].each do |a|
           if target > a
             count = count +  num_rolls_to_target(d-1, f, target - a)
           elsif target == a
             count = count + 1
             break
           end
       end
       
  #     puts "count = #{count}"
       return count
       
   end    
end

#https://www.geeksforgeeks.org/dynamic-programming/
def num_rolls_to_target_recursive_dynamic_programming(d, f, target)
   puts "d #{d} -- f #{f} -- target #{target}"
    if d == 1
      return f >= target ? 1 : 0
    else
       count = 0
       [*1..f].each do |a|
           if target > a
             count = count +  num_rolls_to_target(d-1, f, target - a)
           elsif target == a
             count = count + 1
             break
           end
       end
       
  #     puts "count = #{count}"
       return count
       
   end    
end

