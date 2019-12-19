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

  def game_over
    return :winner if winner?
    return :draw if draw?
    false
  end


  def winner
    
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