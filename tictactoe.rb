class Tictactoe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
    @turn = 0
    @win_condition = [
      [0,1,2],[3,4,5],[6,7,8], #rows
      [0,3,6],[1,4,7],[2,5,8], #columns
      [0,4,8],[2,4,6] #diagonals
    ]
    @playerx_moves = []
    @playero_moves = []
  end

  def display_board
    puts "  #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "  ---------"
    puts "  #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "  ---------"
    puts "  #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def user
    if @turn % 2 == 0
      print "player_o, Please Choose a place: "
      player_o = gets.chomp.to_i
      @playero_moves << player_o - 1
      if player_o > 0 && player_o < 10 && @board[player_o - 1] == " "
        @board[player_o - 1] = "O"
        system "clear"
        display_board
      else
        puts "Invalid input"
        user
        @turn += 1
      end
    else
      print "player_x, Please choose a place: "
      player_x = gets.chomp.to_i
      @playerx_moves << player_x - 1
      if player_x > 0 && player_x < 10 && @board[player_x - 1] == " "
        @board[player_x - 1] = "X"
        system "clear"
        display_board
      else
        puts "invalid input"
        user
        @turn += 1
      end
    end
    @turn += 1
  end

  def playerx_win
    win = false
    @win_condition.each do |condition|
      if @playerx_moves.join.include?(condition.join)
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
ttt = Tictactoe.new
ttt.game