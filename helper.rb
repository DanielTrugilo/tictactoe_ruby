# frozen_string_literal: true

# Common tasks
module Helper
  WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
          [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
          [0, 4, 8], [2, 4, 6]].freeze # diagonals

  def self.win(board, a, b, c)
    [board[a], board[b], board[c]].uniq.length == 1
  end

  def self.draw(board)
    board.all? { |spot| %w[X O].include?(spot) }
  end

  def self.end_game(board)
    WINS.any? { |a, b, c| win(board, a, b, c) }
  end

  def self.valid_input?(input)
    /[012]/.match?(input)
  end

  def self.valid_input_in_game?(input)
    /[0-8]/.match?(input)
  end

  def self.place_empty?(place)
    place != 'X' && place != 'O'
  end

  def self.win_condition(board)
    draw(board) || end_game(board)
  end
end
