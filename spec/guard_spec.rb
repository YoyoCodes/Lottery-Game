require 'guard'
describe Guard do
  describe do 'can participate in the lotery'
    it "checks if the given age is greater than 17 and returns true if it does" do
      expect(subject.can_participate_in_lottery?(20)).to eq(true)
    end

    it "checks if the given age is lesser or equat to 17 and returns false if it does" do
      expect(subject.can_participate_in_lottery?(6)).to eq(false)
    end
  end
end
