require 'peep'

describe Peep do
  describe '.all' do
    it "returns all the peeps" do
      peeps = Peep.all

      expect(peeps).to include("message one")
      expect(peeps).to include("message two")
      expect(peeps).to include("message three")
    end
  end
end
