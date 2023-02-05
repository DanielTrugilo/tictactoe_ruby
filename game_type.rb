# frozen_string_literal: true

require './computer'
require './game_type'
require './player'
require './user_interface'
require './helper'

# The game flow can be found here
class GameType
  def initialize
    @board = %w[0 1 2 3 4 5 6 7 8]
    @computer_one = Computer.new('O')
    @computer_two = Computer.new('X')
    @player_one = Player.new('X')
    @player_two = Player.new('O')

    @interface = UserInterface.new
  end

  def player_vs_computer(difficulty)
    until Helper.win_condition(@board)
      @interface.board(@board)
      @player_one.get_human_spot(@board)
      @computer_one.eval_board(@board, difficulty) unless Helper.win_condition(@board)
    end
    @interface.board(@board)
    if Helper.end_game(@board)
      @interface.winner
    else
      @interface.tie
    end
  end

  def player_vs_player
    until Helper.win_condition(@board)
      @interface.board(@board)
      @player_one.get_human_spot(@board)
      unless Helper.win_condition(@board)
        @interface.board(@board)
        @player_two.get_human_spot(@board)
      end
    end
    @interface.board(@board)
    if Helper.end_game(@board)
      @interface.winner
    else
      @interface.tie
    end
  end

  def computer_vs_computer
    until Helper.win_condition(@board)
      @interface.board(@board)
      @computer_one.eval_board(@board, 1)
      sleep 2
      unless Helper.win_condition(@board)
        @interface.board(@board)
        @computer_two.eval_board(@board, 1)
      end
    end
    @interface.board(@board)
    if Helper.end_game(@board)
      @interface.winner
    else
      @interface.tie
    end
  end
end
