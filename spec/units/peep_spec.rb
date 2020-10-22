require 'peep'

describe Peep do
  subject(:peep) { described_class.new("@leo", "Woof!", "2020-10-10 12:12:12") }

  describe "#initialize" do
    it "has username, body and time" do
      expect(peep.username).to eq "@leo"
      expect(peep.body).to eq "Woof!"
      expect(peep.time).to eq "2020-10-10 12:12:12"
    end
  end
end
