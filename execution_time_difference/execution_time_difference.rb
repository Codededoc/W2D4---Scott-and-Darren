# # Execution Time Difference
#
# ## Learning Goals
#
# * Be able to determine the time and space complexity of a method
# * Be able to compare the time complexity of one method to another
# * Be able to recognize when time or space complexity can be improved
#
# ## `my_min`
#
# Given a list of integers find the smallest number in the list.
#
# Example:
#
# ```ruby
#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5
# ```
#
# ### Phase I
# First, write a function that compares each element to every other element of the list.
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min(list)

  min = nil

  list.each do |ele|
    min ||= ele
    list.each do |ele2|
      if ele2 < min
        min = ele2
      end
    end
  end

  min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
puts my_min(list)

# TIME COMPLEXITY => O(n^2)



# ### Phase II
# Now rewrite the function to iterate through the list just once while keeping
# track of the minimum.  What is the time complexity?

def my_min_ii(list)
  min = list.first
  list.each do |el|
    min = el if el < min
  end
  min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
puts my_min_ii(list)
#time complexity => O(n)

#
#
# ## Largest Contiguous Sub-sum
#
# You have an array of integers and you want to find the largest contiguous
# (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and
# return the max.
#
# Example:
#
# ```ruby
#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8
#
#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# ```
#
# Example 2:
#
# ```ruby
#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# ```
#
# Example 3:
#
# ```ruby
#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])
# ```
#
# ### Phase I
# Write a function that iterates through the array and finds all sub-arrays using
# nested loops. First make an array to hold all sub-arrays. Then find the
# sums of each sub-array and return the max.
def largest_contiguous_subsum(list)
  length = 1
  sub_arrays = []
  until length == list.length
    sub_arrays += list.each_cons(length).to_a
    length += 1
  end
  sub_arrays.map! { |el| el.reduce(:+) }.max

  # sub_arrays = []
  #
  #   list.each_with_index do |ele, idx1|
  #     list.each_with_index do |ele2, idx2|
  #       sub_arrays << list[idx1..idx2] unless list[idx1..idx2].length < 1
  #     end
  #   end
  #   sub_arrays.map! { |el| el.reduce(:+) }.max

end

list = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
puts largest_contiguous_subsum(list)
puts largest_contiguous_subsum(list2)
puts largest_contiguous_subsum(list3)

# Discuss the time complexity of this solution.
# TIME COMPLEXITY => O(n^2)


#
# ### Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory.
# Keep a running tally of the largest sum.
#
def largest_contiguous_subsum2(list)

  largest = list.first
  current = list.first

  list[1..-1].each do |num|
    if current < num && current < 0 #dealing with a condition of negative nums and want to restart
      current = num
    elsif num < 0 && current > largest #about to begin negative nums, compare current and largest
      largest = current
      current += num
    else
      current += num
    end
  end

  return current if largest < current
  largest
end
list = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
list4 = [1, 3, -1, 5]
puts "=========="
p largest_contiguous_subsum2(list)
p largest_contiguous_subsum2(list2)
p largest_contiguous_subsum2(list3)
p largest_contiguous_subsum2(list4)
# Get your story straight, and then explain your solution's time complexity to your TA.
