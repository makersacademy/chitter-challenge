require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      peep = Peep.create(content: 'Hello!')
      Peep.create(content: 'Hello again!')
      Peep.create(content: 'Hello a third time!')
      
      peeps = Peep.all
      
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'Hello!'
      expect(peeps.first.name).to eq 'Jason Wong'
    end
  end

  describe '.create' do
    it 'creates a new peep and adds to collection' do
      peep = Peep.create(content: "No time to die")
      expect(peep).to be_a Peep
      expect(peep.content).to eq "No time to die"
      expect(peep.username).to eq "jasylw"
      expect(peep.name).to eq "Jason Wong"
    end
  end    
end 
