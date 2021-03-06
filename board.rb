# frozen_string_literal: true

# This class sets up the board, and its positions
class Board
  attr_reader :board

  WINNING_POSITIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize(board = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @board = board
  end

  def display_board(_board)
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input - 1
  end

  def move(index, marker)
    @board[index] = marker
  end

  def space_available?(input)
    (0..9).include?(input) && board[input - 1].is_a?(Numeric)
  end

  def winner?
    WINNING_POSITIONS.any? do |pos|
      [board[pos[0]], board[pos[1]], board[pos[2]]].uniq.length == 1
    end
  end

  def board_full?
    board.all? { |cell| %w[X O].include?(cell) }
  end
end
