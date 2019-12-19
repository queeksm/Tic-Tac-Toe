# frozen_string_literal: true
class Cell
  attr_accessor :value
  def initialize(value = "")
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
    get_cell(x,y).value = value
  end


  private
  
  def human_input(number)
    case number
    when number = 1
      coordinates = [0,0]     
    when number = 2
      coordinates = [0,1]     
    when number = 3
      coordinates = [0,2]
    when number = 4
      coordinates = [1,0]
    when number = 5
      coordinates = [1,1]
    when number = 6
      coordinates = [1,2]
    when number = 7
      coordinates = [2,0]
    when number = 8
      coordinates = [2,1]
    when number = 9
      coordinates = [2,2]
    else
      false      
    end
  end 

  public

  def game_over
    return :winner if winner?    
    false
  end

  private
  def winner?
    for n in 0..2
      if (get_cell(n, 0).value == get_cell(n, 1).value && get_cell(n, 1).value == get_cell(n, 2).value) && get_cell(n,0).value != ""
        return true
      end
    end
    for n in 0..2
      if (get_cell(0,n).value == get_cell(1,n).value && get_cell(1,n).value == get_cell(2,n).value) && get_cell(0,n).value != ""
        return true
      end
    end
    if ((get_cell(0,0).value == get_cell(1,1).value && get_cell(1,1).value == get_cell(2,2).value) && get_cell(0,0).value != "") || ((get_cell(0,2).value == get_cell(1,1).value && get_cell(1,1).value == get_cell(2,0).value) && get_cell(1,1).value != "")
      return true
    end
    false
  end  
end

class Game
  attr_reader :players, :board, :player_one, :player_two
  def initialize(players, board = Board.new)
    @players = players
    @board = board
    @player_one, @player_two = players.shuffle
  end

  def turns_switch
    @player_one, @player_two = @player_two, @player_one
  end

  def ask_move
    puts "#{@player_one.name}, please enter a number from 1 to 9 to choose your position."
  end

  def get_move(human_input = gets.chomp)
    human_to_coord(human_input)
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
    if board.game_over == :winner
      return "
      ██╗    ██╗██╗███╗   ██╗███╗   ██╗███████╗██████╗ ██╗
      ██║    ██║██║████╗  ██║████╗  ██║██╔════╝██╔══██╗██║
      ██║ █╗ ██║██║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝██║
      ██║███╗██║██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗╚═╝
      ╚███╔███╔╝██║██║ ╚████║██║ ╚████║███████╗██║  ██║██╗
       ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝
                                                    
      #{@player_one.name} has won the game! #{@player_two.name}, we suggest you learn either how to play or how to cheat."
    else
      return "The game has ended in a tie. You both suck!"
    end
  end

  def play_mode
    puts "Congratulations #{@player_one.name}, you are player one, so you will go first!"
    while 1
      puts Board.new
      puts
      puts ask_move
      x, y = get_move
      board.set_cell(x, y, @player_one.color)
      if board.game_over
        puts game_over_message
        puts rematch
        Board.new
        return
      else
        turns_switch
      end
    end
  end
  
  def rematch
    puts
    puts "Would you like to play again? (Y/N)"
    rematch_answer = gets.chomp.downcase
    if rematch_answer.match(/y/)
      puts
      print "Excellent choice! #{@player_two}, we'd suggest playing better this time if you want to beat #{@player_one}...."
      sleep(1)
      puts
      print "Resetting Game."
      sleep(0.1)
      print "."
      sleep(0.1)
      print "."
      sleep(0.1)
      print "."
      system "clear"
      Game.new(@players).play_mode
    else
      puts
      print "Thank you for playing! Goodbye!"
      
    end
  end

end



def rules_question(rules_answer)
  if rules_answer.match(/y/)
    print "Tic-Tac-Toe is a game played on a simple 3-by-3 board. In this game, you'll choose a number from 1 to 9 to select a spot to place your X or O (like a book reads). In order to win, you must align 3 of your X's or O's in a straight line either horizontally, vertically or diagonally. If neither player manages to line up their X's or O's, the game is a draw."
    puts
    print "Everyone Ready?"
  else
    print "Excellent!"
    puts
  end
end