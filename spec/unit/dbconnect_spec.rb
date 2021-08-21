require 'dbconnect'

describe DBConnect do
  
  describe '.setup' do

    it 'connects to database through pg' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DBConnect.setup('chitter_test')
    end 
  
    it 'creates connection' do
      connection = DBConnect.setup('chitter_test')
      expect(DBConnect.connection).to be_a(PG::Connection)
      expect(DBConnect.connection).to eq connection
    end
  end

  describe '.query' do

    it 'executes queries' do
      connection = DBConnect.setup('chitter_test')
      expect(connection).to receive(:exec_params).with('SELECT * FROM users;')
      DBConnect.query('SELECT * FROM users;')
    end
  end
end
