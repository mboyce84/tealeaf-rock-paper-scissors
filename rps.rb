CHOICES = { 'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors'}

  @computer_score = 0
  @player_score = 0
  @player_name


class String
  def black;          "\033[30m#{self}\033[0m" end
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def brown;          "\033[33m#{self}\033[0m" end
  def blue;           "\033[34m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def gray;           "\033[37m#{self}\033[0m" end
  def bg_black;       "\033[40m#{self}\033[0m" end
  def bg_red;         "\033[41m#{self}\033[0m" end
  def bg_green;       "\033[42m#{self}\033[0m" end
  def bg_brown;       "\033[43m#{self}\033[0m" end
  def bg_blue;        "\033[44m#{self}\033[0m" end
  def bg_magenta;     "\033[45m#{self}\033[0m" end
  def bg_cyan;        "\033[46m#{self}\033[0m" end
  def bg_gray;        "\033[47m#{self}\033[0m" end
  def bold;           "\033[1m#{self}\033[22m" end
  def reverse_color;  "\033[7m#{self}\033[27m" end
end

def greet
  puts '
 _______                       __              _______                                               
/       \                     /  |            /       \                                              
$$$$$$$  |  ______    _______ $$ |   __       $$$$$$$  | ______    ______    ______    ______        
$$ |__$$ | /      \  /       |$$ |  /  |      $$ |__$$ |/      \  /      \  /      \  /      \       
$$    $$< /$$$$$$  |/$$$$$$$/ $$ |_/$$/       $$    $$/ $$$$$$  |/$$$$$$  |/$$$$$$  |/$$$$$$  |      
$$$$$$$  |$$ |  $$ |$$ |      $$   $$<        $$$$$$$/  /    $$ |$$ |  $$ |$$    $$ |$$ |  $$/       
$$ |  $$ |$$ \__$$ |$$ \_____ $$$$$$  \       $$ |     /$$$$$$$ |$$ |__$$ |$$$$$$$$/ $$ |            
$$ |  $$ |$$    $$/ $$       |$$ | $$  |      $$ |     $$    $$ |$$    $$/ $$       |$$ |            
$$/   $$/  $$$$$$/   $$$$$$$/ $$/   $$/       $$/       $$$$$$$/ $$$$$$$/   $$$$$$$/ $$/             
  ______             __                                          $$ |                                
 /      \           /  |                                         $$ |                                
/$$$$$$  |  _______ $$/   _______  _______   ______    ______    _______                             
$$ \__$$/  /       |/  | /       |/       | /      \  /      \  /       |                            
$$      \ /$$$$$$$/ $$ |/$$$$$$$//$$$$$$$/ /$$$$$$  |/$$$$$$  |/$$$$$$$/                             
 $$$$$$  |$$ |      $$ |$$      \$$      \ $$ |  $$ |$$ |  $$/ $$      \                             
/  \__$$ |$$ \_____ $$ | $$$$$$  |$$$$$$  |$$ \__$$ |$$ |       $$$$$$  |                            
$$    $$/ $$       |$$ |/     $$//     $$/ $$    $$/ $$ |      /     $$/                             
 $$$$$$/   $$$$$$$/ $$/ $$$$$$$/ $$$$$$$/   $$$$$$/  $$/       $$$$$$$/                                                            

  '.cyan
  say "Let's play rock, paper, scissors.".cyan
  say "---------------------------------"
  say "What's your name?".brown
  @player_name = gets.chomp.capitalize
end

def say(msg)
  puts "#{msg}"
end


def line
  puts "----------------------".cyan
end

def play
  line
  say "What's your move? R , P or S?".brown
  @player_choice = gets.chomp.downcase
  @computer_choice = CHOICES.keys.sample
  illustrate
end

def illustrate
  if @computer_choice == 'r'
    puts "
          _______
      ---'   ____)
            (_____)
            (_____)
            (____)
      ---.__(___)
    ".cyan

  elsif @computer_choice == 'p'
    puts "
          _______
      ---'   ____)____
                ______)
                _______)
               _______)
      ---.__________)

    ".cyan

  elsif @computer_choice == 's'
    puts " 
          _______
      ---'   ____)____
                ______)
             __________)
              (____)
      ---.__(___)
    ".cyan
    
end
end

def display_score
  say "#{@player_name} #{@player_score} - #{@computer_score} Computer".red
end

def play_again
  say "Do you want to play again (Y/N)?".brown
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
    say "I played #{CHOICES[@computer_choice]}, it's a tie!".gray
    @player_score += 0
  elsif (@player_choice == 'r' && @computer_choice == 's') || (@player_choice == 'p' && @computer_choice == 'r') || (@player_choice == 's' && @computer_choice == 'p') 
    say "I played #{CHOICES[@computer_choice]}, you won!".gray
    line
    @player_score += 1
  else
    say "I played #{CHOICES[@computer_choice]}, you lost!".gray
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
