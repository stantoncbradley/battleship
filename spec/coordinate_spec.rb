# require 'rspec'
# require 'spec_helper'
require_relative '../coordinate'

describe Coordinate do

  before :each do
    @coordinate = Coordinate.new(0,1)
  end

  it 'initializes' do
    expect(@coordinate.x).to eq(0)
    expect(@coordinate.y).to eq(1)
    expect(@coordinate.name).to eq(nil)
    expect(@coordinate.hit).to eq(false)
  end

  describe :add_object do
    it 'adds_object' do
      @coordinate.add_object('Destroyer')
      expect(@coordinate.name).to eq('Destroyer')
    end

    it 'raises if coord taken' do
      @coordinate.add_object('Destroyer')
      expect{@coordinate.add_object('Sub')}.to raise_error("coord 0,1 already taken")
    end
  end

  describe :hit! do
    it 'changes status to hit' do
      @coordinate.hit!
      expect(@coordinate.hit).to eq(true)
    end

    it 'raises if coordinate already hit' do
      @coordinate.hit!
      expect{@coordinate.hit!}.to raise_error("coord 0,1 already hit!")
    end

    it 'returns object name if ship exists' do
      @coordinate.add_object('Destroyer')
      expect(@coordinate.hit!).to eq('Destroyer')
    end
  end

end