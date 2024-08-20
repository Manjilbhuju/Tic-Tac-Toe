class TicTacToe

  #Initializes required data
  def initialize
    print "Enter a size of a board: "
    @size = gets.chomp.to_i
    @board = Array.new(@size){Array.new(@size, " ")}
    @turn = 0
    @win_conditions = generate_win_conditions
    @player_moves = []
  end

  #Displays tictactoe board
  def display_board
    separator = "-" * (@size * 4 - 3)
    @board.each_with_index do |row, index|
      print row.join(" | ")
      puts ""
      puts separator if index < @size - 1
    end
  end

  #Takes User input and adds it in board
  def user_input
    player = gets.chomp.to_i
    row = (player - 1) / @size
    col = (player - 1) % @size
      if player > 0 && player <= @size * @size && @board[row][col] == " "
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
        puts "Invalid input"
        user
        @turn += 1
      end
  end

  #Cycle Users turn
  def user
    if @turn % 2 == 0
      print "player_o, Please Choose a place: "
      user_input
    else
      print "player_x, Please choose a place: "
      user_input
    end
    @turn += 1
  end

  #Generate win conditions according to board size
  def generate_win_conditions
    win_conditions = []

    @size.times do |row|
      win_conditions << (0...@size).map { |col| [row, col] }                    #generate win condition for rows
    end

    @size.times do |col|
      win_conditions << (0...@size).map { |row| [row, col] }                    #generate win condition for columns
    end

    win_conditions << (0...@size).map { |row| [row, row] }                      #generate win condition for diagonals

    win_conditions << (0...@size).map { |row| [row, @size - 1 - row] }

    win_conditions
  end

  #Check whether player won or nor
  def check_win(player)
  
    @win_conditions.each do |condition|
      return true if condition.all? { |row, col| @board[row][col] == player }
    end
  
    false
  end

  #Checks whether board has been filled or not
  def board_filled?
    @board.each do |row|
      row.each do |cell|
        return false if cell == " " || cell == nil
      end
    end
    true
  end

  #Executes game
  def game
    display_board
    until board_filled?
      user
      if check_win('X')
        puts 'X wins'
        break
      elsif check_win('O')
        puts 'O wins'
        break
      elsif board_filled?
        puts "It's a draw!"
        break
      end
    end
  end


end
  ttt = TicTacToe.new
  ttt.game