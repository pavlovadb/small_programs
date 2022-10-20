require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_user_input?(input)
  return false if input.to_i.negative?
  return false if input.to_i.zero?
  return false if input.empty?

  true
end

def calculate_monthly_payment(loan_amount, interest_rate, loan_duration_years)
  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  loan_duration_months = loan_duration_years.to_i * 12

  monthly_payment = loan_amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

  monthly_payment
end

loan_amount = ''
interest_rate = ''
loan_duration_years = ''

loop do
  puts 'Welcome to the loan calculator.'

  loop do
    loan_amount = ''

    loop do
      prompt(MESSAGES['loan_amount'])
      loan_amount = gets.chomp

      break if valid_user_input?(loan_amount)

      prompt(MESSAGES['valid_number'])
    end

    loop do
      prompt(MESSAGES['interest_rate'])
      interest_rate = gets.chomp

      break if valid_user_input?(interest_rate)

      prompt(MESSAGES['valid_interest'])
    end

    loop do
      prompt(MESSAGES['loan_duration'])
      loan_duration_years = gets.chomp

      break if valid_user_input?(loan_duration_years)

      prompt(MESSAGES['valid_duration'])
    end

    input_prompt = <<~MSG
      You entered:
      Loan amount: $#{loan_amount}
      Interest rate: #{interest_rate}%
      Loan duration: #{loan_duration_years} year/s
      => Is this correct? (enter y/n)
    MSG

    prompt(input_prompt)

    prompt("You entered: A loan - $#{loan_amount}; Interest Rate - #{interest_rate}%; Loan Duration - #{loan_duration_years} year/s")
    prompt(MESSAGES['correct'])
    answer = gets.chomp

    break if %w[y yes].include?(answer)

    prompt(MESSAGES['start_over'])
  end

  puts 'Calculating......'

  monthly_payment = calculate_monthly_payment(loan_amount, interest_rate, loan_duration_years)

  puts "Your monthly payment is $#{monthly_payment.round(2)}"
  prompt(MESSAGES['another_calculation'])

  answer = gets.chomp

  break unless %w[y yes].include?(answer)
end

puts 'Thank you for using the calculator.'


# monthly_payment = calculate_monthly_payment(1000, 10.5, 1.5)
# print(monthly_payment == 88.15)