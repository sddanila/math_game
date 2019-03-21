require './question.rb'
require './players.rb'

START = "Let's test your math skills!"
PL1_PROMPT_NAME = "Please enter a name for Player 1"
PL2_PROMPT_NAME = "Please enter a name for Player 2"
NEWTURN = "-------NEW TURN--------"
GAMEOVER = "-------GAME OVER-------"
GOODBYE = "--------GOODBYE--------"

class Game

  def initialize 
    puts START
    puts PL1_PROMPT_NAME
    player1_name = gets.chomp
    @player1 = Player.new(player1_name, true)
    @current_player = @player1
    puts PL2_PROMPT_NAME
    player2_name = gets.chomp
    @player2 = Player.new(player2_name, false)
  end
  
  def run
    until (self.check_player_death)
      self.determine_current_player
      puts NEWTURN
      self.ask_question
      self.get_answer
      self.evaluate_answer
      self.put_score
      self.change_turn
    end
  end

  def determine_current_player
    if @player1.turn
      @current_player = @player1
    else @current_player = @player2
    end
  end

  def check_player_death
    if @current_player.life.zero?
      puts GAMEOVER
      puts @current_player.name + ' lost'
      puts GOODBYE
      return true
    end
  end

  def ask_question
    puts @current_player.name + ':'
    @question = Question.new
    puts @question.question
  end

  def get_answer
    @answer = gets.chomp
  end

  def evaluate_answer
    if @answer == @question.answer
      puts "Well done, " + @player1.name + '!'
    else 
      @current_player.life -= 1
      puts "Seriously? No!"
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