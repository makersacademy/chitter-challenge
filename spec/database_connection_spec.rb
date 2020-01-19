require 'database_connection'
require 'pg'

describe DatabaseConnection do

  subject{DatabaseConnection}

  before(:each) do
    DatabaseConnection.add_details(dbname: 'chitter', user: ENV['USER'], dbms: PG)
  end

  describe '.add_details' do
    it 'stores connection details' do
      expect(subject).to respond_to(:add_details)
    end
  end

  describe '.command' do
    it 'returns querys in array' do
      expect(DatabaseConnection.command('SELECT * FROM users')[0]).to a_kind_of(PG::Result)
    end
    it 'rescues errors' do
      allow_any_instance_of(PG::Connection).to receive(:exec).and_raise('Database Error')
      expect(DatabaseConnection.command('SELECT * FROM users')[1]).to eq 'Database Error'
    end
  end
end
