# FILE: bubble_sort.rb
# Programmer: Steven Anderson
# Last Modified: 8 November 2019
# Description: A sorting algorithm that compares, from left to right, each element of the array and swaps the items so that
#              smallest goes to largest. Based on a fimiliarity with many algorithms in the Java programming language, this is 
#              a Ruby implementation of the, ever useful, Bubble Sort algorithm.
#
#              Importantly, this works for an array of any data type. For strings, capitalized letters come first then lower case.
#              Ruby treats comaprisons between letters by their ascii values. Meaning A = 65, B = 66 etc. and a = 97, b = 98 etc.
#              More can be read here about how Ruby comapres strings: http://www.evc-cit.info/cit020/beginning-programming/chp_02/string_compare.html

# Uses a class structure so that once new algorithms are written they can be implemented or used easily.
class SortingAlg

  # Initialize the bubble sort by taking in an array(of any single type)
  def bubble_sort(array)
    # Gets the length of the passed in array for use as an end point for a loop later
    arr_length = array.length

    # initializes generic loop that will break if two portions of the unsorted array are not in their "swapped" state.
    loop do
      # initialize swapped to false for each element in the array
      swapped = false

      # Begins an embedded loop set to the arrays length - 1 due to arrays starting at 0, so that the loop doesn't overshoot
      # the array at the end.
      (arr_length - 1).times do |i|
        # Checks the array element, starting with positions 0 and compares it to the element at index one larger, or the one
        # directly right of the current element.
        #     If the first looked at index is greater than the next index 1 larger, then the two positions are swapped with each other
        #     else they are left alone and the loop goes to position 1 and compares to 2, then 2 to 3, 3 to 4 etc.
        if array[i] > array[i + 1]
          array[i], array[i + 1] = array[i + 1], array[i]
          swapped = true
        end
      end

      # The generic loop doesn't have a built in stopping point, so once the inner loop is completed, if swapped is ever not
      # equal to false then it breaks the loop and returns the array, sorted at this point.
      break if not swapped
    end

    array
  end
end

# Used a test array fromt he other sorting page.
words = ['treason', 'order', 'democracy', 'law', 'Congress', 'impeach', 'Senate', 'house', 'Republicans', 
         'democrats', 'court', 'press', 'reporting', 'alliance', 'defense', 'washington', 'constitution']

# Initialized and created an object of the SortingAlg class for access to the bubble_sort method.
sort_this = SortingAlg.new

# prints the unsorted then the sorted array.
p words
p sort_this.bubble_sort(words)