#https://leetcode.com/problems/counting-bits/
# with dp
def count_bits(num)
  return [0] if num == 0
    
  l = Array.new(num + 1)
  l[0] = 0
  l[1] = 1

  last_pot = 0 # last power of two

  (2..num).each do |i|
    if is_power_of_two(i)
      l[i] = 1
      last_pot = i
    else
      l[i] = l[last_pot] + l[i - last_pot]
    end
  end

  return l
end

def is_power_of_two(n)
    return (n != 0) && (n & (n-1) == 0)
end


#without
def count_bits_no_dp(n)
    @dp = Array.new(n+1,nil)
    
    i = 0
    while i < n + 1
       @dp[i] = count_one_to_binary(i)
        i = i + 1
    end
    @dp
end

def count_one_to_binary n
    count = 0
    m = n
    while m > 1
     count = count + 1 if m % 2 == 1
     m = m / 2
    end
    
    count = count + 1 if m == 1
    count

end

