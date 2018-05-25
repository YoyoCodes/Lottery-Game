require "result"

describe Result do
  it "returns true if the randomly generated number is equal to  the user input" do
    result = subject.is_the_random_number_matching_user_input?(1, 1)
    expect(result).to be true
  end

  it "returns false if the randomly generated number is equal to  the user input" do
    result = subject.is_the_random_number_matching_user_input?(7, 1)
    expect(result).to be false
  end
end
