require_relative 'coordinate'

class Grid
  def initialize(width, length)
    @coordinates = Array.new(width)
    x = 0
    @coordinates.map! do |column|
      column = []
      (0..(length-1)).each do |y|
        column.push(Coordinate.new(x,y))
      end
      x = x + 1
      column
    end
  end

  def find(x, y)
    raise 'x out of bounds' if @coordinates[x].nil?
    coordinate = @coordinates[x][y]
    raise 'y out of bounds' if coordinate.nil?
    coordinate
  end
end