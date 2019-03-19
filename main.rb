# require ALL classes
require './question.rb'
require './players.rb'
require './game.rb'

game = Game.new


until (game.check_player_death)
  game.determine_current_player
  puts game.ask_question.question
  game.get_answer
  puts game.evaluate_answer
  break if game.check_player_death
  game.put_score
  game.change_turn
  puts "-------NEW TURN--------"
end