class Battleship

  attr_reader :grid, :ships

  def initialize(width, length)
    @grid = Grid.new(width, length)
    @ships = []
  end

  def add_ship(name, initial_coord, length, orientation)
    new_ship = Ship.new(@grid, name, initial_coord, length, orientation)
    @ships.push(new_ship)
  end

  def fire(x,y)
    coord = grid.find(x,y)
    ship_name = coord.hit!
    if ship_name
      ship = @ships.find{ |s|s.name == ship_name }
      if ship.did_sink?
        puts "#{ship} sunk!"
        status = :sunk
      else
        puts "#{ship} hit!"
        status = :hit
      end
      game_over = true
      ships.each { |ship| game_over = false if ship.sunk == false }
      if game_over
        puts "Game Over"
        status = :game_over
      end
    else
      puts "miss"
      status = :miss
    end
    status
  end
end