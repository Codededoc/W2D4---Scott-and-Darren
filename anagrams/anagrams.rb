# # Anagrams
#
# Our goal today is to write a method that determines if two given words are anagrams.
# This means that the letters in one word can be rearranged to form the other word. For example:
#
# ```ruby
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# ```
#
# Assume that there is no whitespace or punctuation in the given strings.
#
# ## Learning Goals
#
# * Be able to determine the time and space complexity of a method
# * Be able to recognize when and how time or space complexity can be improved
# * Be able to compare different methods and discuss how changing inputs affects
# each one's overall runtime
#
# ## Phase I:
# Write a method `#first_anagram?` that will generate and
# store all the possible anagrams of the first string. Check if the second string is one of these.
#
# **Hints:**
# * **For testing your method, start with small input strings, otherwise you might wait a while**
# * If you're having trouble generating the possible anagrams, look into [this method][array-permutation-docs].
#
# What is the time complexity of this solution? What happens if you increase the size of the strings?
#
def first_anagram?(string1, string2)
  return false unless string2.length == string1.length

  anagrams = string1.chars.permutation.to_a

  anagrams.each do |el|
    return true if el.join == string2
  end
  false

end

puts first_anagram?("str", "rtt")

# time complexity => O(n!)


# ## Phase II:
# Write a method `#second_anagram?` that iterates over the first string.
# For each letter in the first string, find the index of that letter in the second string
# (hint: use `Array#find_index`) and delete at that index.
# The two strings are anagrams if an index is found for every letter and
 # the second string is empty at the end of the iteration.
#
# Try varying the length of the input strings.
 # What are the differences between `#first_anagram?` and `#second_anagram?`?

def second_anagram?(string1, string2)

  return false unless string2.length == string1.length

  string2 = string2.chars

  string1.each_char.with_index do |c1, i1|
    return false unless string2.include?(c1)
    string2.delete_at(string2.index(c1))
  end

  string2.empty?
end

puts "=======second anagram======="
puts second_anagram?("str", "rtt")
puts second_anagram?("str", "rts")
#time complexity => O(n)

#
# ## Phase III:
# Write a method `#third_anagram?` that solves the problem by sorting both strings alphabetically.
 # The strings are then anagrams if and only if the sorted versions are the identical.
#

def third_anagram?(string1, string2)
  return false unless string2.length == string1.length
  string1.chars.sort == string2.chars.sort
end



# What is the time complexity of this solution? Is it better or worse than `#second_anagram?`?
#time complexity => n log n  It is worse than second_anagram.



# ## Phase IV:
# Write one more method `#fourth_anagram?`.
# This time, use two Hashes to store the number of times each letter appears in both words.
 # Compare the resulting hashes.
#
# What is the time complexity?

def fourth_anagram?(string1, string2)
  return false unless string2.length == string1.length

  count_hash = Hash.new(0)
  string1.each_char do |ch1|
    count_hash[ch1] += 1
  end

  string2.each_char do |ch2|
    count_hash[ch2] -= 1
  end

  count_hash.values.all? { |v| v == 0 }
end
# **Bonus:** Do it with only one hash.
#

puts "=======fourth anagram======="
puts fourth_anagram?("str", "rtt")
puts fourth_anagram?("str", "rts")

# Discuss the time complexity of your solutions together, then **call over your TA**
# to look at them.

# Fourth_anagram Time Complexity => O(n)


#
# [array-permutation-docs]: http://ruby-doc.org/core-2.2.3/Array.html#method-i-permutation
