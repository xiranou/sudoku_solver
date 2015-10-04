sample = File.readlines(File.expand_path("./sample_unsolved.txt")).first.gsub("\n", "")

class Solver
  attr_accessor :sudoku_board

  def initialize(string)
    @sudoku_board = string.split("")
  end

  def solve!
    # find 0
    # insert guess according to the outcome from rules(vertical, horizonal, quad)
    # store in back track array: {index: guess}
    # repeat ^
    # if no guess availble to current 0, back track up until guess available
  end
end