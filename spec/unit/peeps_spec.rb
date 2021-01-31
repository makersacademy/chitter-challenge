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

  describe '.create' do
    it 'creates a new message and adds to database' do
      create = Peeps.create("Chitter!")
      expect(create).to eq "Chitter! added to database"
    end
  end
end
