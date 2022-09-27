# ask the use for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result


# puts "Welcome to the calculator!"
#
# puts "What's the first number?"
# number_one = gets.chomp
#
# puts "Give me another number: "
# number_two = gets.chomp
#
# puts "What operation would you like to perform? 1) add, 2) subtract, 3) multiply or 4) divide?"
# operator = gets.chomp
#
# if operator == "1"
#   result = number_one.to_i + number_two.to_i
# elsif operator == "2"
#   result = number_one.to_i - number_two.to_i
# elsif operator == "3"
#   result = number_one.to_i * number_two.to_i
# else operator == "4"
#   result = number_one.to_f / number_two.to_f
#
# end
#
# puts "The result is #{result}"

# def find_greatest(numbers)
#   saved_number = numbers[0]
#
#   numbers.each do |num|
#     if saved_number >= num
#       next
#     else
#       saved_number = num
#     end
#   end
#
#   saved_number
# end
#
# puts find_greatest()


def strings(string, two)
  strings.each do |string|
    string + string
  end
end

strings("one", "two")