require 'peep'

describe Peep do
  describe '.all' do
    it 'should list peeps in chronilogical order' do
      Peep.create(user_id: 1, content: 'a peep to test .create method')
      Peep.create(user_id: 1, content: 'a peep to test .create method')
      peep = Peep.create(user_id: 1, content: 'a peep to test .create method')
      peeps = Peep.all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.user_id).to eq peep.user_id
      expect(peeps.first.content).to eq 'a peep to test .create method'
      expect(peeps.first.time).to eq peep.time
    end
  end

  describe '.create' do
    it 'create a new peep' do

    end
  end
end
