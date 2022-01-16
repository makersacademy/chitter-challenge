require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO chitter VALUES(1, 'This is my first peep');")
      connection.exec("INSERT INTO chitter VALUES(2, 'Hello Peeps!');")

      peeps = Peeps.all

      expect(peeps).to include('This is my first peep')
      expect(peeps).to include('Hello Peeps!')
      
    end
  end

  describe '.create' do
    it 'posts a new peep' do
      Peeps.create(name: 'Test peep')

      expect(Peeps.all).to include 'Test peep'
    end
  end
      
end
