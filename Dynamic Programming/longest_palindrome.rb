#https://leetcode.com/problems/longest-palindromic-substring/
=beginGiven a string s, return the longest palindromic substring in s.

Example 1:

Input: s = "babad"
Output: "bab"
Note: "aba" is also a valid answer.
Example 2:

Input: s = "cbbd"
Output: "bb"
Example 3:

Input: s = "a"
Output: "a"
Example 4:

Input: s = "ac"
Output: "a"


p(i,i) = true
p(i, i+1) = s[i] == s[i+1]
P(i,j)=(P(i+1,j−1) and S[i] == s[j]
=end



# @param {String} s
# @return {String}
def longest_palindrome(s)
    @ret = {}
    n = s.length
    max = s[0].to_s
    
    (0..n-1).each do |i|
      (i+1..n-1).each do |j|
        if j - i + 1 < max.length
            next
        else
            @ret["#{i}-#{j}"] = is_palindromic?(s, i, j)
            if @ret["#{i}-#{j}"] && (j - i + 1)> max.length
                max = s[i..j]
            end
        end
      end    
    end    
    
    return max
end

def is_palindromic?(s, left, right)
  if !@ret["#{left}-#{right}"].nil?
      return @ret["#{left}-#{right}"]
   elsif left == right
      return true
  elsif left + 1 == right
      return s[left] == s[right]
  else
      s[left] == s[right] && is_palindromic?(s,left + 1, right -1)   
  end    
end    