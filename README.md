## Conway's Game of Life

####Goals

I hope that this implementation of Conway's Game of Life showcases
* my passion for coding algorithms
* my ability to write clean and maintainable object-oriented code
* my design approach in a TDD environment

From a professional perspective, my goal is that the code in this repository (i) showcases my values, as described above, (ii) hints at the value I might add to a development team, and (iii) shows my potential for growth in a position with strong mentorship.


####FEATURES

######CELLS
* Cells are either living or dead
* Cells can die and even regenerate

######ENVIRONMENT
* Environments have a specific two-dimensional size (height x width)
* The environment can be populated by (living or dead) cells in a specific location
* The entire environment can easily be populated by cells (living or dead)
* The environment displays its cells' locations and liveness/deadness
* The environment knows which cells neighbor each other
* The environment shows the effects of time elapsing (implementation of rules per tick, see Gymrek below)
  1. BIRTH: a cell that is dead at time t will be alive at time t + 1 if exactly 3 of its eight neighbors were alive at time t.
  2. DEATH BY OVERCROWDING: if a cell is alive at time t + 1 and 4 or more of its neighbors are also alive at time t, the cell will be dead at time t + 1.
  3. DEATH BY EXPOSURE: If a live cell at time t has only 1 live neighbor or no live neighbors, it will be dead at time t + 1.
  4. SURVIVAL: a cell survives from time t to time t + 1 if and only if 2 or 3 of its neighbors are alive at time t.

####RESOURCES

[Melissa Gymrek (MIT), Conway's Game of Life](http://web.mit.edu/sp.268/www/2010/lifeSlides.pdf)<br>
[Cornell Math Explorers Club](http://www.math.cornell.edu/~lipa/mec/lesson6.html)
