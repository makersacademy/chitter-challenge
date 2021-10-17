require 'peep'

describe Peep do
  describe '.create' do
    it 'allows you to create new Peeps' do
      peep = Peep.create(content: 'I am a great Peep')
      expect(peep.content).to eq 'I am a great Peep'
    end 
  end 

  describe '.all' do
    it 'returns a list of Peeps' do
      peeps = Peep.all
      expect(peeps).to include 'I am a great Peep'
      expect(peeps).to include 'I am another Peep'
      expect(peeps.length).to eq 2
      # expect(peeps.first).to be_a Peep #this does not work - why? 
    end
  end
end