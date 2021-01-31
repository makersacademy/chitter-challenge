require './lib/peeps'

describe Peeps do

  describe '.all' do
    it 'returns all messages from database' do
      #connect
      connection = PG.connect(dbname: 'peep_manager_test')
      
      #inject
      connection.exec("INSERT INTO peeps (message) VALUES('Test');")

      #confirm
      peeps = Peeps.all
      expect(peeps).to include('Test')
    end
  end

end
