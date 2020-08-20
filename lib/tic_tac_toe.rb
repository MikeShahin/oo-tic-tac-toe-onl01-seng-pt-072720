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
    [2,4,6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    string.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end
  
  def turn_count
    @board.count{|i| i != " "} 
  end
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Pick a position between 1-9"
    user_input = gets
    index = input_to_index(user_input)
    
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.any? do |i|
      if position_taken?(i[0]) && @board[i[0]] == @board[i[1]] && @board[i[1]] == @board[i[2]]
       return i
      end
    end
  end
  
  def full?
    @board.all?{|index| index != " "}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    full? || won?
  end
    
  def winner
    if current_player == "X" && won?
      return "O"
    elsif current_player == "O" && won?
      return "X"
    end
  end
  
  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Everyones a loser here"
  end
end

# 0 1 2
# 3 4 5
# 6 7 8