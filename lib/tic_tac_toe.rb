class TicTacToe
  def initialize(board = nil)
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
  def move(index, current_player)
    @board[index] = current_player
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
  #requests user input
  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  #defines if there is a winning combination, draw, or if the board is empty
  def won?(board)
  empty_board = @board.all? {|empty| empty == " "}
  draw = @board.all? {|token| token == "X" || token == "O"}
  WIN_COMBINATIONS.any? do |win_combo|
    if win_combo.all? {|index| @board[index] =="X" } || win_combo.all? {|index| @board[index] =="O"}
       return win_combo
    else empty_board || draw
        false
      end
    end
  end

  #determines if the board is full
  def full?
    @board.all? { |space| space == "X" || space == "O"}
  end

  #determines if there is a draw/nobody win
  def draw?
    if won?
      return false
    elsif full?
      return true
    else
      return false
    end
  end

  #determines if the game is over by win, draw or full
  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end


  #determines who the winner is
  def winner
    index = []
    index = won?
      if index == false
        return nil
      elsif
        @board[index[0]] == "X"
          return "X"
      else
        return "O"
      end
  end

  #Play method that initiates the loop until game won, full or draw
  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
