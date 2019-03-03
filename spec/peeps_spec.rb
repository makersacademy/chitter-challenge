require 'peep'
require 'database_helpers'
require 'database_connection'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(text: "First peep text test")
      Peep.create(text: "Second peep text test")
      Peep.create(text: "Third peep text test")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'First peep text test'
    end
  end

  describe '.create' do
    it 'create a new peep' do
      peep = Peep.create(text: "First peep text test")
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq "First peep text test"
    end
  end

end
