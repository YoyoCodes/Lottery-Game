require "generator"

describe Generator do
  it "generates a random number between 1 and 10" do
    allow(Kernel).to receive(:rand).with(1..10).and_return(1)
    expect(subject.generate_rand).to eq (1)
  end
end
