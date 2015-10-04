sample = File.readlines(File.expand_path("./sample_unsolved.txt")).first.gsub("\n", "")

class Solver
  attr_accessor :sudoku_board

  def initialize(string)
    @sudoku_board = string.split("")
  end

  def solve!
    # find 0
    current = find_next_empty
    # insert guess according to the outcome from rules(vertical, horizonal, quad)
    # store in back track array: {index: guess}
    # repeat ^
    # if no guess availble to current 0, back track up until guess available
  end

  def find_next_empty
    sudoku_board.each_with_index do |element, index|
      return {index => element} if element == '0'
    end
  end
end

p sample
solver = Solver.new(sample)
p solver.find_next_empty