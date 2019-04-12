require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(content: "First peep!", username: "Deanna")
      Peep.create(content: "Second peep!", username: "Madison")

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.username).to eq 'Deanna'
      expect(peeps.first.content).to eq 'First peep!'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: 'Test Peep', username: 'Deanna')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.username).to eq 'Deanna'
      expect(peep.content).to eq 'Test Peep'
    end
  end
end
