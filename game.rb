# frozen_string_literal: true

require './game_type'
require './user_interface'
require './helper'

# Main file of the project
class Game
  def initialize
    @game_type = GameType.new
    @interface = UserInterface.new
  end

  def start_game
    difficulty = nil
    type = nil

    until Helper.valid_input?(type)
      @interface.intro_menu
      type = gets.chomp
    end

    case type
    when '0'
      until Helper.valid_input?(difficulty)
        @interface.difficulty
        difficulty = gets.chomp
      end
      @game_type.player_vs_computer(difficulty)
    when '1'
      @game_type.player_vs_player
    else
      @game_type.computer_vs_computer
    end
  end
end

game = Game.new
game.start_game
