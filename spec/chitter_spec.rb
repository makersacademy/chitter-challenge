require './lib/chitter'

describe Chitterpeep do
  describe '#add_peep' do
    it'Adds new peeps' do
      peeps = Chitterpeep.add_peep('My first Peep')
     
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