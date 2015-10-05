class Solver
  attr_accessor :sudoku_board, :guessed_indexes

  def initialize(string)
    @sudoku_board = string.split("").map { |e| e.to_i }
    @guessed_indexes = []
  end

  def solve!
    # find 0
    current = find_next_empty
    # while there's still empty spots, current != nil:
    #   guess from 1..9
    #   run each guess to all_passed?:
    #     if all_passed return true:
    #       save guess into current spot, save current spot into backtrack
    #   if none of the guesses return true from all_passed?:
    #     current = guessed_indexes.pop (last position)
    #     start guessing from the last guess up for the new current!
    while !current.nil?
      if has_a_guess?(current)
        current = find_next_empty
      else
        current = guessed_indexes.pop
      end
    end
  end

  def find_next_empty
    sudoku_board.each_with_index do |element, index|
      return index if element == 0
    end
    return nil
  end

  def has_a_guess?(index)
    [*current_guess(index)..9].each do |guess|
      if all_passed?(index, guess)
        sudoku_board[index] = guess
        guessed_indexes << index
        return true
      end
    end
    sudoku_board[index] = 0
    return false
  end

  def current_guess(index)
    sudoku_board[index] + 1
  end

  # def column_passed?(index, guess)
  #   # find all elements in the same column as given index
  #   # return !column_elements.include?(guess)
  #   !find_elements('column', index).include?(guess)
  # end

  # def row_passed?(index, guess)
  #   !find_elements('row', index).include?(guess)
  # end

  # def quad_passed?(index, guess)
  #   !find_elements('quad', index).include?(guess)
  # end

  def all_passed?(index, guess)
    %w(column row quad).all? do |position|
      passed?(position, index, guess)
    end
  end

  def passed?(position, index, guess)
    !find_elements(position, index).include?(guess)
  end

  def find_elements(position, index)
    [].tap do |elements|
      sudoku_board.each_with_index do |b_element, b_index|
        elements << b_element if same_position?(position, b_index, index)
      end
    end
  end

  def same_position?(position, board_index, target_index)
    case position
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

File.readlines(File.expand_path("./sample_unsolved.txt")).each do |sudoku_sample|
  solver = Solver.new(sudoku_sample.gsub("\n", ""))
  puts "=== starting ==="
  solver.display_board
  puts "=== solving ==="
  solver.solve!
  puts "=== finished! ==="
  solver.display_board
end