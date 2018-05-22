class TicTacToe


  initialize
    @board = Array.new(9, " ")
    @player_x = "X"
    @player_o = "O"
  end

  def move(index, player)
    if valid_move?(index)
      @board[index] = player
      return true
    end
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


end
