require 'peep'
require 'pg'

describe Peep, :peep do

  describe '#all' do
    it 'Returns an array of peep hashes' do
      connection = PG.connect(dbname: 'Chitter_test')
      connection.exec("INSERT INTO peeps (text, author) VALUES('Hello World!', 'Sam Worrall');")
      expect(Peep.all).to eq [{ text: 'Hello World!', author: 'Sam Worrall' }]
    end
  end

  describe '#create' do
    it 'Creates a peep and returns a peep instance' do
      Peep.create('Hello World!', 'Sam Worrall')
      expect(Peep.all). to eq [{ text: 'Hello World!', author: 'Sam Worrall' }]
    end
  end
end
