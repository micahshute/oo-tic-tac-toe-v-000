class TicTacToe


  initialize
    @board = Array.new(9, " ")
  end

  def move(index, player)
    if valid_move?(index)
      @board[index] = player
      return true
    end
    return false
  end


end
