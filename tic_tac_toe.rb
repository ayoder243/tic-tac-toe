class BoardSpace
  attr_reader :contents, :played
  def initialize(space_number)
    @played = false
    @contents = " "
    @space_number = space_number
  end

  def set_contents(contents)
    if @played
      return false
    else
      @contents = contents
      @played = true
      return true
    end
  end
end

class Board
  def initialize()
    @turn_number = 0
    @board = []
    for i in (1..9)
      @board.push(BoardSpace.new(i))
    end
  end

  def take_turn(space)
    contents = @turn_number % 2 == 0 ? "x" : "o"
    if @board[space - 1].set_contents(contents) 
      @turn_number += 1
      return true
    else
      return false
    end
  end

  def check_win()
    if @board[0].played
      if @board[0].contents == @board[1].contents and 
         @board[0].contents == @board[2].contents
        return "#{@board[0].contents} wins!"
      elsif @board[0].contents == @board[3].contents and 
            @board[0].contents == @board[6].contents
        return "#{@board[0].contents} wins!"
      elsif @board[0].contents == @board[4].contents and 
            @board[0].contents == @board[8].contents
        return "#{@board[0].contents} wins!"
      end
    elsif @board[1].played 
      if @board[1].contents == @board[4].contents and 
         @board[1].contents == @board[7].contents
        return "#{@board[1].contents} wins!"
      end
    elsif @board[2].played
      if @board[2].contents == @board[4].contents and 
         @board[2].contents == @board[6].contents
        return "#{@board[2].contents} wins!"
      elsif @board[2].contents == @board[5].contents and 
            @board[2].contents == @board[8].contents
        return "#{@board[2].contents} wins!"
      end
    elsif @board[3].played
      if @board[3].contents == @board[4].contents and 
         @board[3].contents == @board[5].contents
        return "#{@board[3].contents} wins!"
      end
    elsif @board[6].played
      if @board[6].contents == @board[7].contents and 
         @board[6].contents == @board[8].contents
        return "#{@board[6].contents} wins!"
      end
    else
      return false
    end
  end
  def display_board()
    puts "#{@board[0].contents}|#{@board[1].contents}|#{@board[2].contents}     1|2|3"
    puts "-----     -----"
    puts "#{@board[3].contents}|#{@board[4].contents}|#{@board[5].contents}     4|5|6"
    puts "-----     -----"
    puts "#{@board[6].contents}|#{@board[7].contents}|#{@board[8].contents}     7|8|9"
  end
end

keep_playing = true

while keep_playing
  game = Board.new()
  until game.check_win()
    game.display_board()
    space = false
    until space
      print "Pick a space: "
      space = game.take_turn(gets.chomp.to_i)
    end
  end
  puts game.check_win()
  print "Do you want to play again? [y/n]: "
  keep_playing = gets.chomp == "y" ? true : false
end