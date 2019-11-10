# Sort words in an array alphabetically using < or >, [/azAZ/], using two arrays: unsorted and sorted.

# Array of words to sort
words = ['atom', 'Sublime', 'vscode', 'vim', 'Jira', 'sql', 'Ruby', 'code', 'Turing', 'iTerm', 'zsh', 'Bear', 'Slack', 'notes', 'database', 'rails', 'kanban', 'Github']

# A method to check for capitalization
def capitalized?(word)
  word == word.capitalize
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

# Method for checking if user wants to add additonal words
def ask_for_input(words)
  user_words = []
  puts "Would you like to add some words to be sorted?"
  puts "1. Yes"
  puts "2. No"

  user_decision = gets.chomp

  # If user wants to add words, enter a loop asking for words until empty input is provided
    if user_decision == "yes" || user_decision == "1"
      loop do
        puts "What word would you like to add?"
        input = gets.chomp

          if input.empty? == true
            puts "Thank you. Sorting..."
            puts " "
            break
          elsif input.match?(/[^a-zA-Z]/) == true
            puts "Please enter a valid word."
            puts " "
          elsif input.empty? == false
            user_words << input
            puts "Thank you. Word saved."
            puts " "
          end
      end

    elsif user_decision == "no" || user_decision == "2"
      puts "Thanks anyways! On to the default sort..."
      puts " "
    else
      puts "You seem to be confused about the options -_-"
      puts "Moving on to the default sort..."
    end

    # Add user words into the words array. Checking for duplicates is handled by the sort.
    user_words.each do |word|
      words << word
    end
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
  puts sorted_array
  puts ' '
  puts ':: unsorted_array ::'
  puts '::::::::::::::::::::'
  puts unsorted_array
  puts ' '
  puts ':: capitalized_words ::'
  puts ':::::::::::::::::::::::'
  puts capitalized_words
  puts ' '
end

sort(words)
