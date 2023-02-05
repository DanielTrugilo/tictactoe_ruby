# frozen_string_literal: true

require './helper'
require './user_interface'

# Register the movement of the player
class Player
  def initialize(player)
    @player = player
    @interface = UserInterface.new
  end

  def valid_input_in_game(input)
    input.match(/[0-8]/)[0].to_i
  end

  def get_human_spot(board)
    input = nil
    @interface.player_input
    until Helper.valid_input_in_game?(input)
      input = gets.chomp
      @interface.player_input unless Helper.valid_input_in_game?(input)
    end
    input = valid_input_in_game(input)
    if Helper.place_empty?(board[input])
      board[input] = @player
    else
      input = nil
    end
  end
end
