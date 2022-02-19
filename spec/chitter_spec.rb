require './lib/chitter'

describe Chitterpeep do
  describe '#add_peep' do
    it'Adds new peeps' do
      Chitterpeep.add_peep('My first Peep')
      peeps = Chitterpeep.view_peep
      expect(peeps).to include "My first Peep"
    end
  end

  describe '#view_peep' do
    it "Can view Peeps" do
      peeps = Chitterpeep.view_peep
      expect(peeps).to include("My first Peep")
    end
  end
end