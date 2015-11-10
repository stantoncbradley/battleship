class Coordinate

  attr_reader :x,:y,:hit,:name

  def initialize(x,y)
    @x = x
    @y = y
    @hit = false
    @name = nil
  end

  def add_object(name)
    raise "coord #{@x},#{@y} already taken" unless @name.nil?
    @name = name
  end

  def hit!
    raise "coord #{x},#{y} already hit!" if @hit == true
    @hit = true
    return @name
  end

end