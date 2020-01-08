require_relative '../lib/game_logic.rb'

RSpec.describe Cell do
  describe '#initialize' do
    it 'initialize the cell with a value of " "' do
      cell = Cell.new
      expect(cell.value).to eql(' ')
    end
  end
end

RSpec.describe Player do
  describe '#initialize' do
    it 'initializes the player with a name' do
      player = Player.new('name1','X')
      expect(player.name).to eq('name1')      
    end
    it 'initializes the player with a color' do
      player = Player.new('name1','X')
      expect(player.color).to eq('X')
    end 
  end
end

RSpec.describe Board do
  describe '#initialize' do
    it 'initializes the board to an empty 3x3 grid' do
      board = Board.new
      cell = Cell.new
      expect(board.grid).should have(3).items
    end
  end
end
