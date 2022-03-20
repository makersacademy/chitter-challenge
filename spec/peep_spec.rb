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
end
