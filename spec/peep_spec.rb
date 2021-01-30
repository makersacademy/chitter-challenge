require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      peep = Peep.create(message: 'This is peep 1')
      Peep.create(message: 'MF peep 2')
      Peep.create(message: 'This is the third and final peep')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'This is peep 1'
    end
  end

  describe '.create' do
    it 'adds a new bookmark to the database' do
      peep = Peep.create(message: 'This is my first peep')
      # persisted_data = persisted_data(id: bookmark.id)

      expect(peep).to be_a Peep
      expect(peep.id.to_i).to be_a Integer
      expect(peep.message).to eq('This is my first peep')
    end
  end

  describe '.delete' do 
    it 'removes a peep from the feed' do 
      peep = Peep.create(message: 'New peep')

      Peep.delete(id: peep.id)
      expect(Peep.all.length).to eq 0
    end
  end
end