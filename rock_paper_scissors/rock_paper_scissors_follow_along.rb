# frozen_string_literal: true

VALID_CHOICE = %w[rock paper scissors lizard spock].freeze

VALID_CHOICE_LETTER = %w[r p s l sp].freeze

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'paper' && second == 'rock' ||
    first == 'paper' && second == 'spock' ||
    first == 'rock' && second == 'scissors' ||
    first == 'rock' && second == 'lizard' ||
    first == 'scissors' && second == 'lizard' ||
    first == 'scissors' && second == 'paper') ||
    first == 'spock' && second == 'rock' ||
    first == 'spock' && second == 'scissors' ||
    first == 'lizard' && second == 'spock' ||
    first == 'lizard' && second == 'paper'
end

def display_results(player, computer_choice)
  if win?(player, computer_choice)
    'You won!'
  elsif win?(computer_choice, player)
    'Lost lost :('
  else
    "It's a tie!"
  end
end


player = ''

play_score = 0
computer_score = 0

loop do
  loop do
    prompt 'Choose one: for rock (r), paper (p), scissors (s), lizard (l), spock (sp)'
    player = gets.chomp.downcase

    case player
    when 'r'
      player = 'rock'
    when 's'
      player = 'scissors'
    when 'p'
      player = 'paper'
    when 'sp'
      player = 'spock'
    when 'l'
      player = 'lizard'
    end

    break if VALID_CHOICE.include?(player) || VALID_CHOICE_LETTER.include?(player)

    prompt "That's not a valid choice"
  end

  computer_choice = VALID_CHOICE.sample
  prompt "You chose #{player} and computer chose #{computer_choice}."

  prompt display_results(player, computer_choice)

  prompt 'Do you want to play again?'
  play_again = gets.chomp

  break unless play_again.include?('y')
end

prompt 'Thanks for playing'
