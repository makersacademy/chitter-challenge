require 'peep'
require 'pg'

describe Peep, :peep do
  let(:peep) { Peep.new('Hello World!', 'Sam Worrall') }

  describe '#all' do
    it 'Returns an array of peep hashes' do
      connection = PG.connect(dbname: 'Chitter_test')
      connection.exec("INSERT INTO peeps (text, author) VALUES('Hello World!', 'Sam Worrall');")
      expect(Peep.all).to eq [peep]
    end
  end

  describe '#create' do
    it 'Creates a peep and returns a peep instance' do
      expect(Peep.create('Hello World!', 'Sam Worrall')).to eq peep
    end
  end

  describe '#text' do
    it 'Returns the text of a peep' do
      Peep.create('Hello World!', 'Sam Worrall')
      expect(Peep.all[0].text).to eq 'Hello World!'
    end
  end

  describe '#author' do
    it 'Returns the author of a peep' do
      Peep.create('Hello World!', 'Sam Worrall')
      expect(Peep.all[0].author).to eq 'Sam Worrall'
    end
  end
end
