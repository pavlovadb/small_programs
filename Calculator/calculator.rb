require 'yaml'
MESSAGES = YAML.load_file('/Users/daniela_pavlova/ruby_stuff/small_programs/calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(op)

  word = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
         end

  word
end

prompt(MESSAGES['welcome'])

name = nil
loop do
  name = gets.chomp

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt "Hi #{name}!"

loop do # main loop
  number_one = nil
  loop do
    prompt(MESSAGES['first_number'])
    number_one = gets.chomp

    if valid_number?(number_one)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number_two = nil
  loop do
    prompt(MESSAGES["second_number"])
    number_two = gets.chomp

    if valid_number?(number_two)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(MESSAGES["operator_prompt"])

 operator = nil

  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operator_validate'])
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result = case operator
           when '1'
             number_one.to_i + number_two.to_i
           when '2'
             number_one.to_i - number_two.to_i
           when '3'
             number_one.to_i * number_two.to_i
           when '4'
             number_one.to_f % number_two.to_f
           end

  prompt "The result is #{result}"

  prompt(MESSAGES['calculate_again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['end_message'])
