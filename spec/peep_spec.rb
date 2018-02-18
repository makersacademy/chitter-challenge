require 'peep.rb'

describe Peep do
  describe ".all" do
    it "returns an array of all peeps in reverse order" do
      peeps = described_class.all
      expect(peeps.first[:text]).to eq "I love dogs"
      expect(peeps[1][:text]).to eq "I love cats"
    end
  end
end
