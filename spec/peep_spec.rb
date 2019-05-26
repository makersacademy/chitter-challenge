require_relative '../lib/peep'

describe Peep do
  describe '#post' do
    it 'should insert an entry into the peep table' do
      Peep.post(text: 'I feel grrrrrreat')
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec("SELECT * FROM peeps")
      expect(result.first['text']).to eq('I feel grrrrrreat')
    end
  end

  describe '#all' do
    it 'should produce an array of peep entries' do
      Peep.post(text: 'I feel grrrrrreat')
      peeps = Peep.all
      expect(peeps.first['text']).to eq('I feel grrrrrreat')
    end
  end
end
