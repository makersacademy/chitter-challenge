require './lib/peeps'

describe Peeps do

  describe '.all' do
    it 'returns all messages from database' do
      #connect
      connection = PG.connect(dbname: 'peep_manager_test')
      
      #inject
      connection.exec("INSERT INTO peeps (message) VALUES('Unit Test 1');")

      #confirm
      peeps = Peeps.all
      expect(peeps).to include('Unit Test 1')
    end
  end

  describe '.create' do
    it 'creates a new message and adds to database' do
      create = Peeps.create("Unit Test 2")
      expect(create).to eq "peep added to database"
    end
  end
end
