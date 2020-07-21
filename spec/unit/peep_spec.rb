require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      PG.connect(dbname: 'chitter_test')
      peep = Peep.create(peep: "A lovely day", time: 'now')
      Peep.create(peep: "An interesting day", time: 'now')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.peep).to eq "A lovely day"
    end
  end

  require 'database_helpers'

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: 'I am feeling ok', time: 'now')
      persisted_data = persisted_data(table: :peeps, id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'I am feeling ok'
    end
  end
end
