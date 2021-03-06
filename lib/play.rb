# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input)
  else
    turn(board)
  end
  display_board(board)
end

# Define your play method below
def play(board)
  players_turn = 0
until players_turn == 9
     turn(board)
     players_turn += 1
end
  puts "This game is over!"
end

def turn_count(board)
  turn_count(board) % 2 == 0? "X": "O"
end

def current_player(board)
  counter = 0
  board.each do |l|
    if l == "X" || l == "0"
      counter += 1
    end
  end
  return counter
end
end
