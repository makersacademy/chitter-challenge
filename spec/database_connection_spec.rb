require 'database_connection'

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
    it 'returns querys as PG Result' do
      expect(DatabaseConnection.command('SELECT * FROM users')).to a_kind_of(PG::Result)
    end
    it 'rescues errors' do
      expect{DatabaseConnection.command('Error')}.to output(%Q[ERROR:  syntax error at or near \"Error\"\nLINE 1: Error\n        ^\n]).to_stdout
    end
  end
end
