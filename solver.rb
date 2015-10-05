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
      return {index => element} if element == 0
    end
  end

  def column_passed?(index, guess)
    # find all elements in the same column as given index
    # return !column_elements.include?(guess)
    !find_elements('column', index).include?(guess)
  end

  def row_passed?(index, guess)
    !find_elements('row', index).include?(guess)
  end

  def quad_passed?(index, guess)
    !find_elements('quad', index).include?(guess)
  end

  def find_elements(option, index)
    [].tap do |elements|
      sudoku_board.each_with_index do |b_element, b_index|
        elements << b_element if same_location?(option, b_index, index)
      end
    end
  end

  def same_location?(option, board_index, target_index)
    case option
    when 'column'
      board_index % 9 == target_index % 9
    when 'row'
      board_index / 9 == target_index / 9
    when 'quad'
      [(board_index%9)/3, (board_index/9)/3] == [(target_index%9)/3, (target_index/9)/3]
    end
  end

  def display_board
    sudoku_board.each_slice(9) do |row|
      puts row.join(" | ")
    end
  end
end

solver = Solver.new(sample)
solver.display_board
puts
# p solver.find_elements('column', 0)
# p solver.column_passed?(0, 3)
# puts
# p solver.find_elements('row', 0)
# p solver.row_passed?(0, 3)
# puts
p solver.find_elements('quad', 0)
p solver.quad_passed?(0, 3)