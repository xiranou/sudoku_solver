sample = File.readlines(File.expand_path("./sample_unsolved.txt")).first.gsub("\n", "")

class Solver
  attr_accessor :sudoku_board

  def initialize(string)
    @sudoku_board = string.split("").map { |e| e.to_i }
  end

  def solve!
    # find 0
    current = find_next_empty
    # start guessing from [*1..9]
    # insert guess to rules(vertical, horizonal, quad)
    # if all rules passed: store in back track array: {index: guess}
    # else: move up from guess array
    # repeat ^
    # if no guess availble to current, back track up until guess available
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