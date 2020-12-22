require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(text: 'First tester')
      Peep.create(text: 'Second tester')
      Peep.create(text: 'Third tester')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_kind_of Peep
      expect(peeps.first.text).to eq 'First tester'
      expect(peeps.first.id).to eq peep.id
    end
  end

  describe '.create' do
    it 'creates a peep' do
      peep = Peep.create(text: 'New peep')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_kind_of Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq 'New peep'
    end
  end

  describe '#time' do
    it 'stores timestamp' do
      peep = Peep.create(text: 'Timestamp tester')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep.text).to eq 'Timestamp tester'
      expect(peep.timestamp).to eq persisted_data.first['timestamp']
    end
  end
end
