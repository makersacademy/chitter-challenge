require_relative '../lib/peep'

describe Peep do
  let(:subject) { Peep }

  describe '.all' do
    it 'returns an array of peeps' do
      connection = PG.connect(dbname: 'chitter_app_test')
      Peep.create(text: 'My first peep')
      expect(subject.all).to include('My first peep')
    end
  end

  describe '.create' do
    it 'creates new peep' do
    connection = PG.connect(dbname: 'chitter_app_test')
    peep = subject.create(text: 'My second peep')
    expect(peep.first['text']).to include('My second peep')
    end
  end

end
