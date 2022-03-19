require 'peep'
require 'database_helpers'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

        peep1 = Peep.post(peep: 'What a beautil day!')
        peep2 = Peep.post(peep: 'Going for a run now')

    p  peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.peep).to eq 'What a beautil day!'
      expect(peeps.first.id).to eq peep1.id
    end
  end

  describe '#post' do
    it 'posts a new peep' do
      peep = Peep.post(peep: 'Studying all the weekend long...')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.peep).to eq 'Studying all the weekend long...'
      expect(peep.id).to eq persisted_data.first['id']
    end
  end
end
