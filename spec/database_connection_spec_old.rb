require 'database_connection'
require 'pg'

describe DbConnection do

  before(:each) do
    DbConnection.add_details(dbname: 'chitter', user: ENV['USER'], dbms: PG)
  end

  describe '.add_details' do
    it 'stores connection details' do
      expect(DbConnection).to respond_to(:add_details).with(3).arguments
    end
  end

  describe '.command' do
    it 'connects to database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter-test', user: ENV['USER'])
      DbConnection.command('SELECT * FROM users')
    end
    it 'disconnects from database' do
      expect(con).to receive(:close)
      DbConnection.command('SELECT * FROM users')
    end
    it 'sends query to database' do
      expect(con).to receive(:exec).with('SELECT * FROM users')
      DbConnection.command('SELECT * FROM users')
    end
    it 'returns querys in array' do
      expect(DbConnection.command('SELECT * FROM users')[0]).to a_kind_of(Integer)
    end
    it 'rescues errors' do
      allow(con).to receive(:exec).and_raise('Database Error')
      expect(DbConnection.command('SELECT * FROM users')[1]).to eq 'Database Error'
    end
  end
end
