require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')

      connection.exec("INSERT INTO peeps (content) VALUES ('Hello World');")
      connection.exec("INSERT INTO peeps (content) VALUES ('Sunny today');")
    
      peeps = Peep.all

      expect(peeps).to include('Hello World')
      expect(peeps).to include('Sunny today')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(content: 'Howdy', time: '2006-01-01 00:00:01')

      expect(Peep.all).to include 'Howdy'
    end
  end
end
