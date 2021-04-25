require 'chitter'
require 'database_helpers'

describe Chitter do

  describe '#.all method' do
    it 'can return all peeps' do
      peep = Chitter.create(message: "Test Peep")
      Chitter.create(message: "Peep Testing!")

      peeps = Chitter.all
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Chitter
      expect(peeps.first.peep_id).to eq peep.peep_id
      expect(peeps.first.message).to eq "Test Peep"
    end
  end

  describe '#create method' do
    it 'can create a new peep' do
      peep = Chitter.create(message: 'New peep added!')
      database_helper = database_helper(peep_id: peep.peep_id)

      expect(peep).to be_a Chitter
      expect(peep.peep_id).to eq database_helper.first['peep_id']
      expect(peep.message).to eq 'New peep added!'
    end
  end

  describe '#reverse method' do
    it 'can show peeps in reverse chronological order' do
      Chitter.create(message: "Test peep added 1st")
      Chitter.create(message: "Test peep added 2nd!")
      Chitter.create(message: "Test peep added 3rd!")

      peeps = Chitter.flip
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Chitter
      expect(peeps.first.message).to eq "Test peep added 3rd!"
    end
  end

end
