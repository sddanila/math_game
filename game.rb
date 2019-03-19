require './question.rb'
require './players.rb'

class Game

  attr_reader :current_player, :ask_question, 
              :check_player_death, :get_answer, :put_score, :determine_current_player
  attr_accessor :change_turn, :evaluate_answer
  

  def initialize 
    puts "Let's test your math skills!"
    puts "Please enter a name for Player 1"
    player1_name = gets.chomp
    @player1 = Player.new(player1_name, true)
    @current_player = @player1
    puts "Please enter a name for Player 2"
    player2_name = gets.chomp
    @player2 = Player.new(player2_name, false)
  end
  
  def determine_current_player
    if @player1.turn == true
      @current_player = @player1
    else @current_player = @player2
    end
  end

  def check_player_death
    if @current_player.life == 0
      puts "-------GAME OVER-------"
      puts @current_player.name + ' lost'
      puts "--------GOODBYE--------"
      return true
    end
  end

  def ask_question
    puts @current_player.name + ':'
    @question = Question.new
  end

  def get_answer
    @answer = gets.chomp
  end

  def evaluate_answer
    if @answer == @question.answer
      return "Well done, " + @player1.name + '!'
    else 
      @current_player.life -= 1
      return "Seriously? No!"
    end
  end

  def change_turn
    if (@current_player == @player1)
      @player1.turn = false
      @player2.turn = true
      puts @player2.name + "'s turn!"
    else 
      @player1.turn = true
      @player2.turn = false
      puts @player1.name + "'s turn!"
    end
  end

  def put_score
    puts @player1.name + ": " + @player1.life.to_s + "/3 vs. " + @player2.name + ": " + @player2.life.to_s + "/3"
  end
end