require 'peep'
require 'database_helpers'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      test = Peep.create(message: 'First test peep')
      Peep.create(message: 'Another test peep')
      peeps = Peep.all
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq test.id
      expect(peeps.first.message).to eq 'First test peep'
      expect(peeps.first.time).to eq Time.now
    end
  end

  describe '.create' do
    it 'posts a new peep' do
      peep = Peep.create(message: 'weekend challenges are so much fun')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'weekend challenges are so much fun'
    end
  end

end
