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
=end


# @param {String} s
# @return {String}
def longest_palindrome(s)
    @ret = {}
    n = s.length
    max = s[0].to_s
    
    (0..n-1).each do |i|
      (i..n-1).each do |j|
        @ret["#{i}-#{j}"] = is_palindromic?(s, i, j)
        if @ret["#{i}-#{j}"] && (j - i + 1)> max.length
            max = s[i..j]
        end
      end    
    end    
    
    return max
end

def is_palindromic?(s, start_i, end_i)
  if !@ret["#{start_i}-#{end_i}"].nil?
      return @ret["#{start_i}-#{end_i}"]
   elsif start_i == end_i
      return true
  elsif start_i + 1 == end_i
      return s[start_i] == s[end_i]
  else
      is_palindromic?(s,start_i + 1, end_i -1) && s[start_i] == s[end_i]  
  end    
end    