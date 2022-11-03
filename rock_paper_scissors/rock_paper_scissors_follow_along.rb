# frozen_string_literal: true

VALID_CHOICE = %w[rock paper scissors lizard spock].freeze

VALID_CHOICE_LETTER = %w[r p s l sp].freeze

def prompt(message)
  puts "=> #{message}"
end

WINNING_COMBOS = {
  "paper" => %w[rock spock],
  "rock" => %w[scissors lizard],
  "scissors" => %w[lizard paper],
  "spock" => %w[rock scissors],
  "lizard" => %w[spock paper]
}

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

def display_results(player, computer_choice)
  if win?(player, computer_choice)
    'You won this round!'
  elsif win?(computer_choice, player)
    'You lost this round.'
  else
    "It's a tie!"
  end
end

def display_score(player_score, computer_score)
  if player_score == 3
    puts 'You won the game'
  else
    computer_score == 3
    puts 'You lost this game'
  end
end

player = ''
player_score = 0
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

  if win?(player, computer_choice)
    player_score += 1
  elsif win?(computer_choice, player)
    computer_score += 1
  end

  prompt "Your score: #{player_score}"
  prompt "Computer score: #{computer_score}"

  if player_score == 3
    prompt 'GRAND WINNER'
    break
  elsif computer_score == 3
    prompt 'COMPUTER WON'
    break
  end

  # prompt 'Do you want to play again?'
  # play_again = gets.chomp
  #
  # break unless play_again.include?('y')
end

prompt 'Thanks for playing'
