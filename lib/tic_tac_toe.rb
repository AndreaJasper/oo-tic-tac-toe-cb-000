class TicTacToe
  def initialize(board)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #waiting for user input and converts it to index
  def input_to_index(user_input)
  user_input.to_i - 1
  end

    #places user input onto the board
  def move(board, index, current_player)
    board[index] = current_player
    if current_player = "X" || "O"
      return true
    else
      return false
    end
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  
end
