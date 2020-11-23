require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps in reverse order' do
      PG.connect(dbname: 'chitter_test')
      Peep.create(content: 'First database table peep!', timestamptz: '2020-11-20 20:05:38+00')
      Peep.create(content: 'Peep peep', timestamptz: '2020-11-20 22:06:38+00')
      Peep.create(content: 'Chitter chatter', timestamptz: '2020-11-20 20:07:38+00')

      peeps = Peep.all

      expect(peeps.length).to eq(3)
      expect(peeps.first.content).to eq('Chitter chatter')
      expect(peeps.last.content).to eq('First database table peep!')
      expect(peeps.first.timestamptz).to eq('2020-11-20 20:07:38+00')
      expect(peeps.last.content).to eq('First database table peep!')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: 'Lavender or grapefruit washing up liquid?', timestamptz: '2020-11-22 22:05:38+00').first

      expect(peep['content']).to eq('Lavender or grapefruit washing up liquid?')
      expect(peep['timestamptz']).to eq('2020-11-22 22:05:38+00')
    end
  end
end
