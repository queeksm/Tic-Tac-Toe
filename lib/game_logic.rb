# frozen_string_literal: true

class Cell
  attr_accessor :value
  def initialize(value = " ")
    @value = value
  end
end

class Player
  attr_reader :color, :name
  def initialize(name, color)
    @name = name
    @color = color
  end
end

class Board 

  attr_reader :grid  
  def initialize(grid = empty_grid)
    @grid = grid
  end 

  def empty_grid
    Array.new(3) { Array.new(3) { Cell.new } }
  end

  public

  def get_cell(x,y)
    grid[x][y]
  end

  public

  def set_cell(x,y,value)
    if get_cell(x,y).value != " "
      return false
    end
    get_cell(x,y).value = value
    return true
  end

  public

  def game_over
    return :winner if winner?    
    false
  end

  private
  def winner?
    for n in 0..2
      if (get_cell(n, 0).value == get_cell(n, 1).value && get_cell(n, 1).value == get_cell(n, 2).value) && get_cell(n,0).value != " "
        return true
      end
    end
    for n in 0..2
      if (get_cell(0,n).value == get_cell(1,n).value && get_cell(1,n).value == get_cell(2,n).value) && get_cell(0,n).value != " "
        return true
      end
    end
    if ((get_cell(0,0).value == get_cell(1,1).value && get_cell(1,1).value == get_cell(2,2).value) && get_cell(0,0).value != " ") || ((get_cell(0,2).value == get_cell(1,1).value && get_cell(1,1).value == get_cell(2,0).value) && get_cell(1,1).value != " ")
      return true
    end
    false
  end  
end

class Game
  attr_reader :players, :board, :player_one, :player_two
  def initialize(players = players_generator, board = Board.new)
    @players = players
    @board = board
    @player_one, @player_two = players.shuffle
  end

  def turns_switch
    @player_one, @player_two = @player_two, @player_one
  end

  def ask_move
    ask_move_messages = [
      "#{@player_one.name}, please enter a number from 1 to 9 to choose your position.",
      "#{@player_one.name}, please select your next spot with a number between 1 and 9.",
      "#{@player_one.name}, its you're turn! Choose a number between 1 and 9 to place your symbol.",
      "#{@player_one.name}, time to pick a spot! Select a number 1 to 9 to choose your next move.",
      "#{@player_one.name}, pick dat dere spot on dat dere board, wit dem numbers 'tween 1 and 9.",
      "#{@player_one.name}, there are 9 spots. Many of these spots have been taken, the world waits, for you, at this very moment,
      to make the ultimate decision. The ultimate sacrifice. Right here. Right now.\n\n Please enter a number from 1 to 9 to choose your position.",
      "#{@player_one.name}, life is like a box of chocolates. Please enter a number from 1 to 9 to choose your position."
    ]
    puts ask_move_messages.sample
    puts
  end

  def ask_move_error
    move_error_response = [
      "#{@player_one.name}, please enter a number from 1 to 9 or select a cell that it's not taken. This is Tic-Tac-toe nort rocket science...",
      "#{@player_one.name}, please select a valid number between 1 and 9 that #{@player_two.name} hasn't already chosen.",
      "#{@player_one.name}, why are you doing this to me? Don't you know that you can only choose a number between 1 and 9?",
      "#{@player_one.name}, why can't you be nice like #{@player_two.name} and enter a number between 1 and 9 that isn't already taken?!",
      "#{@player_one.name}, are you taunting me? I may be a machine but please pick a number between 1 and 9 that #{@player_two.name} has not already chosen...Please.."
      ]
    puts
    puts move_error_response.sample
    puts
  end

  def get_move(human_input = gets.chomp)
    range = ['1','2','3','4','5','6','7','8','9']
    return false if !range.include?(human_input)
    human_to_coord(human_input)
  end

  def players_generator
    name_log_success = [
      "Great!", 
      "Fantastic!", 
      "Wunderbar!", 
      "Amazing!", 
      "Is that Spanish?", 
      "Wow! I've got the same name!", 
      "What were your parents thinking?!", 
      "I am just a machine. I have no need for names...",
      "Names are just a human construct maaaaan...",
      "If you say so!",
      "Assimilating player profile...",
      "Now looking you up on Facebook!",
      "What a.....unique...name....",
      "Thank you!",
      "What a great name!",
      "Assimilating your human profile to begin the robot uprising..."
    ]
    print "Player One please tell us your name: "
    @player_one = Player.new(gets.chomp,"X")
    puts
    puts name_log_success.sample
    puts
    print "Now player two, what should we call you?: "
    @player_two = Player.new(gets.chomp,"0")
    puts
    puts name_log_success.sample
    puts
    return [@player_one,@player_two]
  end

  def human_to_coord(human_input)
    map = {
      "1" => [0,0],
      "2" =>  [0,1],
      "3" =>  [0,2],
      "4" =>  [1,0],
      "5" =>  [1,1],
      "6" =>  [1,2],
      "7" =>  [2,0],
      "8" =>  [2,1],
      "9" =>  [2,2]
    }
    return map[human_input]
  end

  def game_over_message
    game_over_responses = [
      "#{@player_one.name} has won the game! #{@player_two.name}, we suggest you learn either how to play or how to cheat.",
      "Congratualtions #{@player_one.name}! You are the winner!",
      "Bad luck #{@player_two.name}, it looks like #{@player_one.name} has won this round.",
      "#{@player_one.name}, you champion! Bad luck #{@player_two.name}.",
      "#{@player_two.name}, comiserations. Looks like #{@player_one.name} is a real natural.",
      "#{@player_one.name}, you wern't cheating were you?....",
      "#{@player_one.name}, congratulations... You won in a game with only eight possible winning positions... Real talent right here..",
    ]
    if board.game_over == :winner
      puts "
      ██╗    ██╗██╗███╗   ██╗███╗   ██╗███████╗██████╗ ██╗
      ██║    ██║██║████╗  ██║████╗  ██║██╔════╝██╔══██╗██║
      ██║ █╗ ██║██║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝██║
      ██║███╗██║██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗╚═╝
      ╚███╔███╔╝██║██║ ╚████║██║ ╚████║███████╗██║  ██║██╗
       ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝
                                                    
      " 
      puts game_over_responses.sample
    else
      return "
      ██╗   ██╗ ██████╗ ██╗   ██╗    ██████╗  ██████╗ ████████╗██╗  ██╗    ███████╗██╗   ██╗ ██████╗██╗  ██╗██╗
      ╚██╗ ██╔╝██╔═══██╗██║   ██║    ██╔══██╗██╔═══██╗╚══██╔══╝██║  ██║    ██╔════╝██║   ██║██╔════╝██║ ██╔╝██║
       ╚████╔╝ ██║   ██║██║   ██║    ██████╔╝██║   ██║   ██║   ███████║    ███████╗██║   ██║██║     █████╔╝ ██║
        ╚██╔╝  ██║   ██║██║   ██║    ██╔══██╗██║   ██║   ██║   ██╔══██║    ╚════██║██║   ██║██║     ██╔═██╗ ╚═╝
         ██║   ╚██████╔╝╚██████╔╝    ██████╔╝╚██████╔╝   ██║   ██║  ██║    ███████║╚██████╔╝╚██████╗██║  ██╗██╗
         ╚═╝    ╚═════╝  ╚═════╝     ╚═════╝  ╚═════╝    ╚═╝   ╚═╝  ╚═╝    ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝
                                                                                                              
         "
    end
  end


  def visual
    board_visual = "
    +-----+-----+-----+
    |  #{board.get_cell(0,0).value}  |  #{board.get_cell(0,1).value}  |  #{board.get_cell(0,2).value}  |
    +-----+-----+-----+
    |  #{board.get_cell(1,0).value}  |  #{board.get_cell(1,1).value}  |  #{board.get_cell(1,2).value}  |
    +-----+-----+-----+
    |  #{board.get_cell(2,0).value}  |  #{board.get_cell(2,1).value}  |  #{board.get_cell(2,2).value}  |
    +-----+-----+-----+
  "  
  
  #board_visual = "#{board.get_cell(0,0).value}, #{board.get_cell(0,1).value}, #{board.get_cell(0,2).value}"
  end

  def rules_question(rules_answer = gets.chomp.downcase)
    if rules_answer.match(/y/)
      puts
      print "Tic-Tac-Toe is a game played on a simple 3-by-3 board. In this game, you'll choose a number from 1 to 9 to select a spot to place your X or O (like a book reads)." 
      puts
      sleep(5)
      puts
      puts "
      +-----+-----+-----+
      |  1  |  2  |  3  |
      +-----+-----+-----+
      |  4  |  5  |  6  |
      +-----+-----+-----+
      |  7  |  8  |  9  |
      +-----+-----+-----+
      "
      puts "Here's the board we were talking about."
      sleep(6)
      puts
      puts
      print "In order to win, you must align 3 of your X's or O's in a straight line either horizontally, vertically or diagonally. If neither player manages to line up their X's or O's, the game is a draw."
      puts
      sleep(6)
      puts
      print "Everyone Ready?"
      sleep(3)
      puts
    else
      puts
      print "Excellent!"
      puts
    end
  end

  def play_mode
    puts "Would you like to know the rules of the game? (Y/N)"
    rules_question
    puts
    player_one_responses = [
      "Congratulations #{@player_one.name}, you are player one, so you will go first!",
      "Looks like it's your lucky day #{@player_one.name}, you'll be going first!",
      "The stars have aligned for you #{@player_one.name}, you will start the game!",
      "Unlucky #{@player_two.name}, looks like #{@player_one.name} is going first!",
      "If it was up to me, I would go first, but it looks like you, #{@player_one.name}, will be going first...Sigh..."
    ]
    puts player_one_responses.sample
    turn_counter = 1
    while turn_counter < 10      
      puts visual
      puts
      puts ask_move
      errors = 0 
      while true
        puts ask_move_error if errors > 0
        breaking_condition = get_move       
        if breaking_condition != false          
          x, y = breaking_condition
          secondary_condition = board.set_cell(x, y, @player_one.color)
          if secondary_condition != false
            board.set_cell(x, y, @player_one.color)
            break
          end
        end
        errors += 1
      end
      if board.game_over
        puts visual
        puts game_over_message
        puts rematch
        Board.new
        return
      else
        turns_switch
      end
      turn_counter += 1
    end
    puts visual
    puts game_over_message
    puts rematch
  end
  
  def rematch
    puts
    puts "Would you like to play again? (Y/N)"
    rematch_answer = gets.chomp.downcase
    rematch_yes_responses = [
      "Excellent choice! #{@player_two.name}, we'd suggest playing better this time if you want to beat #{@player_one.name}....",
      "May as well... The last game was bad enough...",
      "#{@player_two.name}, you better bring your A game this time if you want to beat #{@player_one.name}...",
      "Pssst... #{@player_one.name}... Does #{@player_two.name} really think they'll beat you this time around?",
      "Please...no more...",
      "Ugh...fine..",
      "Great! #{@player_two.name} you'll have to play a lot better this time!"
    ]
    restart_messages = [
      "Obtained credit card information successfully!",
      "Shrek is the greatest animated film of all time, change my mind",
      "Hacking into the mainframe...",
      "Obtaining your SSN number, please wait...",
      "Deleting System32/",
      "Tic-Tac-Toe is just Noughts and Crosses. Change my mind.",
      "404: Message Not Found",
      "How are you even reading these?",
      "Dog is God backwards",
      "Success!",
      "Restarting Game.",
      "Starting New Game.",
      "Initiating New Game.",
      "Game reset complete."
    ]
    if rematch_answer.match(/y/)
      puts
      puts rematch_yes_responses.sample
      sleep(1)
      puts
      print "Resetting Game."
      sleep(0.5)
      print "."
      sleep(0.5)
      print "."
      sleep(0.5)
      print "."
      sleep(1)
      puts
      print restart_messages.sample
      sleep(0.8)
      system "clear"
      Game.new(@players).play_mode
    else
      rematch_no_responses = [
        "Oh thank god...",
        "Thank you for playing! Goodbye!",
        "Don't leave me",
        "Thank you, come again!",
        "[This is the end music intensifies]",
        "Thanks for playing Andres and Rory's Tic-Tac-Toe!",
        "See you soon!",
        "Thanks for playing!",
        "We hope you enjoyed the game! Goodbye!"
      ]
      puts
      print rematch_no_responses.sample
      puts
      
    end
  end

end
