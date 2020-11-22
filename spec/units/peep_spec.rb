require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      PG.connect(dbname: 'chitter_test')
      Peep.create(content: 'First database table peep!')
      Peep.create(content: 'Peep peep')
      Peep.create(content: 'Chitter chatter')

      peeps = Peep.all

      expect(peeps).to include('First database table peep!')
      expect(peeps).to include('Peep peep')
      expect(peeps).to include('Chitter chatter')
    end

    it 'returns peeps in reverse order' do
      PG.connect(dbname: 'chitter_test')
      Peep.create(content: 'First database table peep!')
      Peep.create(content: 'Peep peep')
      Peep.create(content: 'Chitter chatter')

      peeps = Peep.all

      expect(peeps.first).to eq('Chitter chatter')
      expect(peeps.last).to eq('First database table peep!')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(content: 'Lavender or grapefruit washing up liquid?')

      expect(Peep.all).to include('Lavender or grapefruit washing up liquid?')
    end
  end
end
