require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'Provides a list of Peeps' do
      PG.connect(dbname: "Chitter_Test")

      Peep.create(peep: "Hi Chitter!")
      peep = Peep.create(peep: "I love Chitter!")

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq "I love Chitter!"
      expect(peeps.first.timestamp).to eq peep.timestamp
    end
  end

  describe '.create' do
    it 'Allows you to post a new peep' do
      peep = Peep.create(peep: "Hi Chitter!")

      persisted_data = persisted_data(table: :peep, id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.peep).to eq "Hi Chitter!"
      expect(peep.timestamp).to eq persisted_data['timestamp']

    end
  end
end
