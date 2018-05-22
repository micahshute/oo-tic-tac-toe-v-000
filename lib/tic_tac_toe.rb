require 'set'

class TicTacToe


  initialize
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

  def input_to_index(input)
    input - 1
  end

  def is_even(num)
    num % 2 == 0
  end

  def current_player
    is_even(@board.reject{|space| space != "X" || space != "O"}.length) ? player_x : player_o
  end

  def turn
    puts "Enter a number bewteen 1-9:"
    index = input_to_index(gets.strip)
    move(index, current_player)
  end

  def play
    until over?
      turn
    end
    puts won? ? "Congratulations, #{winner}" : "Cat's Game!"
  end

  def over?
    full? || won?
  end

  def winner
    x_moves = @board.select{ |i| i == "X" }.to_set
    o_moves = @board.select{ |i| i == "O" }.to_set
    
    @WIN_COMBINATIONS.each do |combination|
      c = combination.to_set
      if c.is_subset(x_moves)
        return player_x
      elsif c.is_subset(o_moves)
        return player_o
      end
    end
    return nil
  end

  def full?
    @board.select{ |i| i == "X" || i == "O" }.length == 9
  end

  def won?
    winner != nil
  end

  

end
