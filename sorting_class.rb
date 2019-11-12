# Uses a class structure so that once new algorithms are written they can be implemented or used easily.
class Sorting
  # Initialize the bubble sort by taking in an array(of any single type)
  def string_sort(array)
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
        if array[i].downcase > array[i + 1].downcase
          array[i], array[i + 1] = array[i + 1], array[i]
          swapped = true
        end
      end

      # The generic loop doesn't have a built in stopping point, so once the inner loop is completed, if swapped is ever not
      # equal to false then it breaks the loop and returns the array, sorted at this point.
      break if not swapped
    end

    # Returns the array
    array
  end
  # Uses the same bubble sort algorithm as the following algorithm to perform a sort on a non string array.
  def number_sort(array)
    arr_length = array.length

    loop do
      swapped = false

      (arr_length - 1).times do |i|
        if array[i] > array[i + 1]
          array[i], array[i + 1] = array[i + 1], array[i]
          swapped = true
        end
      end

      break if not swapped
    end
    array
  end

  # A method to sort an array of words
  def the_sort(array, sorted_array, unsorted_array, capitalized_words)
    # Array for holding the current lowest word
    low_word = []
    # Array for holding the current word
    current_word = []

    array.each do |word|
      # Check word for capitalization, and if capitalized push to capitalized words
      capitalized_words.push(word) if capitalized?(word) == true
      # Downcase word to prepare for sort
      word = word.downcase
      # Set the word from the array to be the current word
      current_word.replace([word])
      # Push the word into the low word array if it's empty
      low_word.push(word) if low_word.empty? == true

      # If current word is greater than low word, and unsorted array doesn't already include it, push word to it
      if current_word.to_s > low_word.to_s && unsorted_array.include?(word) == false
        unsorted_array.push(word)

      # If current word is less than low word, and unsorted array doesn't already include it, push word to it
      elsif current_word.to_s < low_word.to_s && unsorted_array.include?(low_word) == false
        unsorted_array.push(low_word.at(0))
        # Replace the low word with the current |word|
        low_word.replace([word])
      end
    end
    # Put the low word from this iteration in the sorted array
    sorted_array.push(low_word.at(0))
    # Delete the low word from this iteration if unsorted array contains it. It will be removed from the next iteration
    unsorted_array.delete_if { |word| word == low_word.at(0) }
  end

  # Execute this to sort and display results
  def sort(words)
    # Arrays for sorting
    sorted_array = []
    unsorted_array = []
    capitalized_words = []

    # Get user input
    ask_for_input(words)

    # Iterate through the words array first
    the_sort(words, sorted_array, unsorted_array, capitalized_words)

    # Loop through the words in unsorted array until it's empty
    while unsorted_array.empty? == false
      # Iterate and sort the the unsorted_array until it's empty
      the_sort(unsorted_array, sorted_array, unsorted_array, capitalized_words)
    end

    # Using the .map! method to re-capitalize the Capitalized words in the sorted array
    sorted_array.map! do |lowercase_word|
      # If both the capitalized words array and the sorted array contain the same word, capitalize it
      if capitalized_words.include?(lowercase_word.capitalize)
        # Capitalize the |lowercase_word| in sorted array
        lowercase_word.capitalize
      else
        # Skip word if it's lowercase
        lowercase_word
      end
    end

    # Print the resulting output to the terminal
    puts ':: sorted_array ::'
    puts '::::::::::::::::::'
    p sorted_array
    puts ' '
    puts ':: unsorted_array ::'
    puts '::::::::::::::::::::'
    p unsorted_array
    puts ' '
    puts ':: capitalized_words ::'
    puts ':::::::::::::::::::::::'
    p capitalized_words
    puts ' '
  end

  # A method to check for capitalization
  def capitalized?(word)
    word == word.capitalize
  end
end