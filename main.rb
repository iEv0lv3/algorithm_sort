# Adds the sorting algorithm class from another file for use in this file.
require_relative "sorting_class"
require_relative "word_processing"

# Sort words in an array alphabetically using < or >, [/azAZ/], using two arrays: unsorted and sorted.

# Array of words to sort
words = ["treason", "order", "democracy", "law", "Congress", "impeach", "Senate", "house", "Republicans", 
         "democrats", "court", "press", "reporting", "alliance", "defense", "washington", "constitution"]

numbers = [1, 2, 988, 345, 34563, 654356, 2345, 778, 965, 1234, 41341234, 778, 3, 2, 4, 6]

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

# Initialized and created an object of the SortingAlg class for access to the bubble_sort method.
sort_this = Sorting.new

sort_this.sort(words)

# prints the unsorted then the sorted array.
puts "\n:: unsorted_string ::"
puts ":::::::::::::::::::::"
p words

puts "\n:: sorted_string ::"
puts ":::::::::::::::::::"
p sort_this.string_sort(words)

puts "\n:: unsorted_numbers ::"
puts "::::::::::::::::::::::"
p numbers

puts "\n:: sorted_numbers ::"
puts "::::::::::::::::::::::"
p sort_this.number_sort(numbers)
