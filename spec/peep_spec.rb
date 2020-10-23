require './lib/peeps'

describe Peeps do
  describe '#.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter')

      peeps = Peeps.all

      expect(peeps).to include 'Happy Friday!'
      expect(peeps).to include 'Does chitter remind you of anything? Tweet Tweet'
    end
  end
end