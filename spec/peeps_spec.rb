require 'peeps'
describe Peeps do
  describe "#add" do
    it "adds a peep to the list" do
      peep = Peeps.add(peep: 'Just chilling...')

      expect(peep.peep).to eq ('Just chilling...')
    end
  end
end
