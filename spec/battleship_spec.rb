require_relative '../battleship'

describe Battleship do

  before @each do
    @bs = Battleship.new(10,10)
  end

  it 'adds a ship' do
    @bs.add_ship('Destroyer',[0,0],5,:h)
    ship = @bs.ships.first
    expect(ship.name).to eq 'Destroyer'
    expect(ship.sunk).to eq false
  end

  describe :fire do
    before @each do
      @ship = @bs.add_ship('Sub',[0,0],2,:v)
    end

    it 'returns miss if miss' do
      expect(@bs.fire(1,0)).to eq(:miss)
    end

    it 'returns hit if hit' do
      expect(@bs.fire(0,1)).to eq(:hit)
    end

    it 'returns sunk if sunk (and not game over)' do
      @bs.add_ship('Sub',[5,5],2,:v)
      @bs.fire(0,0)
      expect(@bs.fire(0,1)).to eq(:sunk)
    end

    it 'returns game_over if all ships sunk' do
      @bs.fire(0,0)
      expect(@bs.fire(0,1)).to eq(:game_over)
    end


  end

end