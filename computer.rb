# frozen_string_literal: true

require './helper'

# Is used to determine the computer plays
class Computer
  def initialize(computer)
    @computer = computer
  end

  def eval_board(board, difficulty)
    spot = nil

    return board[4] = @computer if board[4] == '4'

    until spot
      spot = get_best_move(board, @computer, difficulty)
      if board[spot] != 'X' && board[spot] != 'O'
        board[spot] = @computer
      else
        spot = nil
      end
    end
  end

  def get_best_move(board, computer, difficulty)
    available_spaces = board.select { |b| Helper.place_empty?(b) }

    case difficulty
    when '0'
      random_move(available_spaces)
    when '1'
      if rand < 0.5
        random_move(available_spaces)
      else
        ideal_move(available_spaces, board, computer)
      end
    else
      ideal_move(available_spaces, board, computer)
    end
  end

  def random_move(available_spaces)
    n = rand(0..available_spaces.count)
    available_spaces[n].to_i
  end

  def ideal_move(available_spaces, board, _computer)
    best_move = nil

    available_spaces.each do |as|
      board[as.to_i] = @computer
      if Helper.end_game(board)
        best_move = as.to_i
        board[as.to_i] = as
        best_move
      else
        board[as.to_i] = @player
        if Helper.end_game(board)
          best_move = as.to_i
          board[as.to_i] = as
          best_move
        else
          board[as.to_i] = as
        end
      end
    end
    best_move || random_move(available_spaces)
  end
end
