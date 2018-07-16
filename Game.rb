require './Question.rb'
require './Player.rb'

class Game

attr_accessor :player_one, :player_two

 def initialize
   @players = []
   @player_one = Player.new(setPlayerName('Player 1'))
   @players << @player_one
   @player_two = Player.new(setPlayerName('Player 2'))
   @players << @player_two
   @current_player = @player_one
 end

 def setPlayerName(player)
   puts "Enter a name for player #{player}"
   name = gets.chomp
   puts "Welcome, #{name}!"
   return name
 end

 def switch_player(player)
   if player == @player_one
     @current_player = @player_two
   else @current_player = @player_one
   end
 end

 def summary
   puts ''
   puts "#{@player_one.name}: #{@player_one.score}/3 vs #{@player_two.name}: #{@player_two.score}/3"
   puts ''
 end

 def check_game_status
   @players.each do |player|
     if player.score == 0
       if player == @player_one
         winner = @player_two
       else winner = @player_one
       end
       return puts "------- #{winner.name.upcase} WINS! ------- "
     end
   end
   summary
   puts ""
   puts "------- NEW TURN -------"
   puts ""
 end

 def play
   while (@player_one.score > 0 && @player_two.score > 0)
     q = Question.new(@current_player)
     q.check_answer
     check_game_status
     switch_player(@current_player)
   end
 end

end
