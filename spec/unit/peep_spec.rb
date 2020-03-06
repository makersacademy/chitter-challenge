require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      peep = Peep.create(content: 'Hello!', name: 'Jen', username: 'jenny')
      Peep.create(content: 'Hello again!', name: 'Bob', username: "bobby")
      Peep.create(content: 'Hello a third time!', name: 'Sam', username: "sammy")
      
      peeps = Peep.all
      
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'Hello!'
      expect(peeps.first.name).to eq 'Jen'
    end
  end

  describe '.create' do
    it 'creates a new peep and adds to collection' do
      peep = Peep.create(content: "No time to die", name: "Billie", username: 'billie_e')
      expect(peep).to be_a Peep
      expect(peep.content).to eq "No time to die"
      expect(peep.username).to eq "billie_e"
      expect(peep.name).to eq "Billie"
    end
  end    
end 
