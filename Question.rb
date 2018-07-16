require './Player.rb'

class Question

  attr_accessor :answered

  def initialize(player)
    @current_player = player

    @num1 = Random.rand(1..20)
    @num2 = Random.rand(1..20)
    @answer = @num1 + @num2

    puts "#{player.name}: What does #{@num1} + #{@num2} equal?"
    @input = gets.chomp.to_i
    @answered = false
  end

  def check_answer
    if @input == @answer
      puts "==> #{@input} is CORRECT! Good job #{@current_player}!"
      puts
    else
      puts "==> #{@input} is INCORRECT!"
      puts
      @current_player.wrong
      puts "#{@current_player.name} you lost a life! #{@current_player.score} lives left."
    end
    @answered = true
  end

end
