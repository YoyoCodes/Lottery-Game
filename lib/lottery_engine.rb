require "generator"
require "result"
require "guard"

class LotteryEngine

  def initialize(generator, result, guard, age)
    @generator = generator
    @result = result
    @guard = guard
    @age = age
  end

  def play(input)
    guard = @guard.can_participate_in_lottery?(@age)
    generated_number = @generator.generate_rand
    match = @result.is_the_random_number_matching_user_input?(generated_number, input)
    raise "You are too young to participate!" unless guard
    if  match
      "Congrads, you won!"
    else
      "You lose, try again!"
    end

  end


end
