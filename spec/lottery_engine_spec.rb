require "lottery_engine"
describe LotteryEngine do
  
  describe "#play" do
    it "returns a success message when the user wins" do
      result = Result.new
      allow(result).to receive(:is_the_random_number_matching_user_input?)
      .with(5, 5).and_return(true)
      generator = Generator.new
      allow(generator).to receive(:generate_rand).and_return(5)
      guard = Guard.new
      allow(guard).to receive(:can_participate_in_lottery?).with(30).and_return(true)

      lottery = LotteryEngine.new(generator, result, guard, 30)
      result = lottery.play(5)

      expect(result).to eq"Congrads, you won!"
    end

    it "returns a failure message when the user looses" do
      result = Result.new
      allow(result).to receive(:is_the_random_number_matching_user_input?)
      .with(7, 3).and_return(false)
      generator = Generator.new
      allow(generator).to receive(:generate_rand).and_return(7)
      guard = Guard.new
      allow(guard).to receive(:can_participate_in_lottery?).with(30).and_return(true)

      lottery = LotteryEngine.new(generator, result, guard, 30)
      result = lottery.play(3)

      expect(result).to eq"You lose, try again!"
    end

    it "returns failure message when user is too young to play" do
      age = 15
      guard = Guard.new
      generator = Generator.new
      result = Result.new
      allow(guard).to receive(:can_participate_in_lottery?).with(age).and_return(false)
      lottery = LotteryEngine.new(generator, result, guard, age)
      expect{lottery.play(6)}.to raise_error "You are too young to participate!"
    end
  end
end
