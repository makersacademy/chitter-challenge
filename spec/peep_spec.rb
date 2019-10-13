require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      # test data
      my_peep = Peep.create(peep: "first peep", username: "Josh")
      Peep.create(peep: "second peep", username: "Josh")
      Peep.create(peep: "third peep", username: "Josh")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq my_peep.id
      expect(peeps.first.username).to eq 'Josh'
      expect(peeps.first.peep).to eq 'first peep'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      my_peep = Peep.create(peep: 'new peep', username: 'Josh')
      persisted_data = persisted_data(id: my_peep.id, table: 'peeps')

      expect(my_peep).to be_a Peep
      expect(my_peep.id).to eq persisted_data.first['id']
      expect(my_peep.username).to eq 'Josh'
      expect(my_peep.peep).to eq 'new peep'
    end
  end
end
