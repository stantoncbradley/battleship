# battleship
TDD battleship game using Ruby/RSpec

API:

Initialize game:
<br>
```game = Battleship.new(grid_width,grid_length)```
<br><br>
Add ships:
<br>
```game.add_ship(ship_name,initial_coordinate,ship_length,orientation(:h or :v))```
<br><br>
Fire!:
<br>
```game.fire(x_coordinate,y_coordinate)```
<br>
Returns ```:miss,:hit,:sunk,``` and ```:game_over```
