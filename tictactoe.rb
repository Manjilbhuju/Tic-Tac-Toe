class TicTacToe

  #Initializes required data
  def initialize
    print "Enter a size of a board: "
    @size = gets.chomp.to_i
    @board = Array.new(@size){Array.new(@size, " ")}
    @turn = 0
    @win_condition = [
      [0,1,2],[3,4,5],[6,7,8], #rows
      [0,3,6],[1,4,7],[2,5,8], #columns
      [0,4,8],[2,4,6] #diagonals
    ]
    @player_moves = []
  end

  #Displays tictactoe board
  def display_board
    separator = "-" * (@size * 4 - 2)
    @board.each do |row|
      row.each do |cell|
        print "#{cell} |"
      end
      puts "\n" + separator
    end
  end

  #Takes User input and adds it in board
  def user_input
    player = gets.chomp.to_i
    row = (player - 1) / @size
    col = (player - 1) % @size
      if player > 0 && player < @size * @size && @board[row][col] == " "
        if @turn % 2 == 0
          @board[row][col] = "O"
          system "clear"
          display_board
        else
          @board[row][col] = "X"
          system "clear"
          display_board
        end
      else
        puts @turn 
        puts "Invalid input"
        user
        @turn += 1
      end
  end

  #Makes a move
  def user
    if @turn % 2 == 0
      print "player_o, Please Choose a place: "
      user_input
    else
      print "player_x, Please choose a place: "
      user_input
    end
  end
  
  def playerx_win
    win = false
    @win_condition.each do |condition|
      if @playeboard_sizerx_moves.join.include?(condition.join)
        win = true
        break
      end
    end
    win
  end
  
  def playero_win
    win = false
    @win_condition.each do |condition|
      if @playero_moves.join.include?(condition.join)
        win = true
        break
      end
    end
    win
  end

  def board_filled?
    @board.none? {|cell| cell == " "}
  end

  def game
    display_board
    user
    until board_filled?
      user
      if playerx_win
        puts "Player X wins!"
        break
      elsif playero_win
        puts "Player O wins!"
        break
      elsif board_filled?
        puts "It's a draw!"
      end
    end
  end


end
  ttt = TicTacToe.new
  ttt.game