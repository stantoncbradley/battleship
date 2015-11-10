class Ship

  attr_reader :sunk, :name

  def initialize(grid, name, initial_coord, length, orientation)
    # raise "#{name} already taken!" if name taken
    raise 'orientation must be :h or :v' unless [:h,:v].include? orientation

    @name = name
    @sunk = false
    @coordinates = []

    x = initial_coord[0]
    y = initial_coord[1]

    @coordinates.push(grid.find(x,y))
    (1..(length-1)).each do |index|
      if orientation == :h
        x = x+1
      else
        y = y+1
      end
      @coordinates.push(grid.find(x,y))
    end

    @coordinates.each{|c| raise "coord #{x},#{y} already taken" unless c.name.nil? }
    @coordinates.each{|c| c.add_object(@name)}
  end

  def did_sink?
    sunk = true
    @coordinates.each{|c| sunk = false unless c.hit }
    @sunk = sunk
  end

end