# battleship
TDD battleship game using Ruby/RSpec

API:

Initialize game:
```game = Battleship.new(grid_width,grid_length)```
Add ships:
```game.add_ship(ship_name,initial_coordinate,ship_length,orientation(:h or :v))```
Fire!:
```game.fire(x_coordinate,y_coordinate)```
Returns ```:miss,:hit,:sunk,``` and ```:game_over```
