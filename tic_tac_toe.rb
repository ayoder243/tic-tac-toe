# class Board
#     @turn_number = 0
#     @board = []
#     for 1-9
#       add new BoardSpace to @board
#     take_turn(space, contents)
#       if space is played?
#         get new answer
#       else
#         mark space played?
#         set contents=contents
#         turn_number++
#         if turn_number > 2
      # check_win
      #   check 0,1,2
      #         0,3,6
      #         0,4,8
      #         1,4,7
      #         2,5,6
      #         2,5,8
      #         3,4,5
      #         6,7,8
#     display_board
#         "{@board[0]}|{@board[1]}|{@board[2]}"
#         "------"
#         "{@board[3]}|{@board[4]}|{@board[5]}"
#         "------"
#         "{@board[6]}|{@board[7]}|{@board[8]}"
# end

class BoardSpace
  attr_reader :contents
  def initialize(space_number)
    @played = false
    @contents = nil
    @space_number = space_number
  end

  def set_contents(contents)
    if @played
      return "Error: Space already taken"
    else if contents == 'x' || contents == 'o'
      @contents = contents
      @played = true
    else
      return "Error: Needs to be x or o"
    end
  end
end