require_relative '../ship'

describe Ship do

  before :each do
    @grid = Grid.new(10,10)
  end

  describe :initialize do

    it 'initializes' do
      @ship = Ship.new(@grid, 'Destroyer', [0,0], 5, :h)
      expect(@ship.name).to eq('Destroyer')
      expect(@ship.sunk).to eq(false)
    end

    it 'raises if coord taken' do
      @grid.find(3,0).add_object('taken')
      expect{Ship.new(@grid, 'Destroyer', [0,0], 5, :h)}.to raise_error
    end

    # didn't find a good way yet to track names of instance methods
    # can track initialization but not destruction of object until GC
    xit 'raises if name taken' do
      first = Ship.new(@grid, 'Destroyer',[1,0],5,:h)
      expect{Ship.new(@grid, 'Destroyer',[1,1],5,:h)}.to raise_error
    end

    it 'raises if orientation != :v or :h' do
      expect{Ship.new(@grid, 'Destroyer',[0,0],5, :horizational)}.to raise_error
    end

  end

  describe :did_sink? do

    before :each do
      @ship = Ship.new(@grid, 'Sub', [0,0], 3, :h)
    end

    it 'returns false if ship not hit' do
      expect(@ship.did_sink?).to eq(false)
    end

    it 'returns false if ship has one spot left' do
      @grid.find(0,0).hit!
      @grid.find(1,0).hit!
      expect(@ship.did_sink?).to eq(false)
    end

    it 'returns true if all coords hit' do
      @grid.find(0,0).hit!
      @grid.find(1,0).hit!
      @grid.find(2,0).hit!
      expect(@ship.did_sink?).to eq(true)
    end

  end

end