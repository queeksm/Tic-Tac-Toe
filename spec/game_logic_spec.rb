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
  let(:player) {Player.new('name1', 'X')}
  describe '#initialize' do
    it 'initializes the player with a name' do
      expect(player.name).to eq('name1')      
    end
    it 'initializes the player with a color' do
      expect(player.color).to eq('X')
    end 
  end
end

RSpec.describe Board do
  describe '#initialize' do
    let(:board) {Board.new}
    let(:cell) {Cell.new}
    it 'initializes the board without any values' do
      expect(board.grid).to_not include(@value)
    end

    it 'initializes the board with empty cells' do
      expect(board.grid).to_not include(@cell)
    end

    it 'initializes the board as an array' do
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

    context "#set_cell" do
      it "Fetches a cell and then replaces the value." do
        board.set_cell(1,1,"WW3")
        expect(board.get_cell(1,1).value).to eql("WW3")
      end
    end

    context "#game_over" do
      it "Checks for a winning condition on every row" do
        board.set_cell(0,0,'X')
        board.set_cell(1,0,'X')
        board.set_cell(2,0,'X')
        expect(board.game_over).to eq(:winner)
      end
    end

    context "#game_over" do
      it "Checks for a winning condition on every column" do
        board.set_cell(0,0,'X')
        board.set_cell(0,1,'X')
        board.set_cell(0,2,'X')
        expect(board.game_over).to eq(:winner)
      end
    end

    context "#game_over" do
      it "Checks for a winning condition on every diagonal" do
        board = Board.new
        board.set_cell(0,0,'X')
        board.set_cell(1,1,'X')
        board.set_cell(2,2,'X')
        expect(board.game_over).to eq(:winner)
      end
    end
  end
end

RSpec.describe Game do
  let(:players) {[Player.new('p1','X'),Player.new('p2','O')]}
  let(:game) {Game.new(players)}
  describe "#turns_switch" do
    it "switch the player one and player two every turn" do
      player1 = game.player_one
      player2 = game.player_two
      game.turns_switch
      expect(player1).to eq(game.player_two)
    end
  end

  describe "#human_to_coord" do
    it "Parses a human input from 1 to 9 into a coordinate (x,y)" do
      expect(game.human_to_coord('5')).to eq([1,1])
    end

    it "Parses a human input from 1 to 9 into a coordinate (x,y)" do
      expect(game.human_to_coord('45')).to eq(nil)
    end
  end
end
