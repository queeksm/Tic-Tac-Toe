# frozen_string_literal: true
class Cell
  attr_accessor :sign
  def initialize(sign = nil)
    @sign = sign
  end
end

class Player
  attr_reader :color, :name
  def initialize(name, color)
    @name = name
    @color = color
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