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
    it 'initializes the board without any values' do
      board = Board.new
      cell = Cell.new
      expect(board.grid).to_not include(@value)
    end

    it 'initializes the board with empty cells' do
      board = Board.new
      cell = Cell.new
      expect(board.grid).to_not include(@cell)
    end

    it 'initializes the board as an array' do
      board = Board.new
      cell = Cell.new
      expect(board.grid).to be_an_instance_of(Array)
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "iamagrid")
        expect(board.grid).to eq(grid: "iamagrid")
      end
    end

    context "#get_cell" do
      it "fetches the cell with given (x, y) coordinates" do
        grid = [["", "", ""], ["", "", "MAGA"], ["", "", ""]]
        board = Board.new(grid)
        expect(board.get_cell(1, 2)).to eq("MAGA")
      end
    end
  end
end
