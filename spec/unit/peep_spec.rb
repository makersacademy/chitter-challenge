require 'peep'

describe Peep do
  describe "#all" do
    it "shows a list of all Peeps" do

      add_test_peeps
      peeps = Peep.all

      expect(peeps).to include('Test peep 1')
      expect(peeps).to include('Test peep 2')
      expect(peeps).to include('Test peep 3')
    end
  end
end
