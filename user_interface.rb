# frozen_string_literal: true

# Every interface element is created here
class UserInterface
  def intro_menu
    puts <<~MENU
      Choose the game type:
      0 - Human vs Computer
      1 - Human vs Human
      2 - Computer vs Computer
    MENU
  end

  def difficulty
    puts <<~DIFFICULTY
      Choose the difficulty:
      0 - Easy
      1 - Medium
      2 - Hard
    DIFFICULTY
  end

  def board(board)
    puts <<~BOARD
      #{board[0]} | #{board[1]} | #{board[2]}
      ===+===+===
      #{board[3]} | #{board[4]} | #{board[5]}
      ===+===+===
      #{board[6]} | #{board[7]} | #{board[8]}

    BOARD
  end

  def player_input
    puts 'Choose between 0-8'
  end

  def winner
    puts 'The game has ended!'
  end

  def tie
    puts 'The game tied!'
  end
end
