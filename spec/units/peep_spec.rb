require 'peep'

describe Peep do
  describe '.create' do
    it 'creates a peep' do
      peep = Peep.create("My first peep!")
      expect(peep).to be_a Peep
      expect(peep.content).to eq "My first peep!"
    end
  end

 # describe '.all' do
 #   it 'returns array of all peeps' do
 #     Peep.create("One peep")
 #     Peep.create("Two peep")
 #     peeps = Peep.all
 #     first_peep = peeps.first
 #     expect(peeps.length).to eq 2
 #     expect(first_peep.content).to eq "One peep" 
    #end
#  end
end