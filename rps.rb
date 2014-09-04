CHOICES = { 'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors'}

  @computer_score = 0
  @player_score = 0
  @player_name

def greet
  say "Let's play rock, paper, scissors."
  say "---------------------------------"
  say "What's your name?"
  @player_name = gets.chomp.capitalize
end

def say(msg)
  puts "#{msg}"
end

def line
  puts "----------------------"
end

def play
  line
  say "What's your move? R , P or S?"
  @player_choice = gets.chomp.downcase
  @computer_choice = CHOICES.keys.sample
end

def display_score
  say "#{@player_name} #{@player_score} - #{@computer_score} Computer"
end

def play_again
  say "Do you want to play again (Y/N)?"
  play_again = gets.chomp.downcase
  if play_again == 'y'
    play
    compare
  else
    exit
  end
end

def compare
  if @player_choice == @computer_choice
    say "I played #{CHOICES[@computer_choice]}, it's a tie!"
    @player_score += 0
  elsif (@player_choice == 'r' && @computer_choice == 's') || (@player_choice == 'p' && @computer_choice == 'r') || (@player_choice == 's' && @computer_choice == 'p') 
    say "I played #{CHOICES[@computer_choice]}, you won!"
    line
    @player_score += 1
  else
    say "I played #{CHOICES[@computer_choice]}, you lost!"
    line
    @computer_score += 1
    
  end
  display_score
  play_again
end

def launch!
	until CHOICES.keys.include?(@player_choice) do
    play
  end
  compare
end

greet
launch!