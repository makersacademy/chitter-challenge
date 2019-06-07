require 'peep'

describe Peep do
  describe "#all" do
    it 'can show all peeps' do
      peeps = Peep.all
      expect(peeps).to include("Hello World")
      expect(peeps).to include("Hello James")
    end
  end
end
