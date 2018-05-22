require 'set'

class TicTacToe

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def initialize
    @board = Array.new(9, " ")
    @player_x = "X"
    @player_o = "O"
    @WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
  end

  def move(index, player)
    if valid_move?(index)
      @board[index] = player
      return true
    end
    puts "Invalid move."
    return false
  end


  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index >=0 && index <=8 && !position_taken?(index)
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def is_even(num)
    num % 2 == 0
  end

  def current_player
    is_even(@board.reject{|space| space != "X" && space != "O"}.length) ? @player_x : @player_o
  end

  def turn
    puts "Enter a number bewteen 1-9:"
    index = input_to_index(gets.strip)
    move(index, current_player)
    display_board
  end

  def play
    display_board
    until over?
      turn
    end
    puts won? ? "Congratulations, #{winner(false)}!" : "Cat's Game!"
  end

  def over?
    full? || won?
  end

  def winner(want_combo = true)
    x_moves = Set.new
    o_moves = Set.new

    @board.each.with_index do |move, index|
      if move == "X"
        x_moves.add(index)
      elsif move == "O"
        o_moves.add(index)
      end
    end

    @WIN_COMBINATIONS.each do |combination|
      c = combination.to_set
      if c.subset?(x_moves)
        return want_combo ? combination : @player_x
      elsif c.subset?(o_moves)
        return want_combo ? combination : @player_o
      end
    end
    return nil
  end

  def full?
    @board.select{ |i| i == "X" || i == "O" }.length == 9
  end

  def won?
    winner
  end

  def draw?
    full? && !won?
  end

end
