require_relative '../grid'

describe Grid do

  before :each do
    @grid = Grid.new(2,2)
  end

  it 'finds coordinate on grid' do
    coord = @grid.find(0,1)
    expect(coord.x).to eq(0)
    expect(coord.y).to eq(1)
  end

  it 'raises if x coord out of bounds' do
    expect{@grid.find(2,1)}.to raise_error('x out of bounds')
  end

  it 'raises if y coord out of bounds' do
    expect{@grid.find(1,2)}.to raise_error('y out of bounds')
  end

end