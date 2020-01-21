require 'database_connection'

describe 'DatabaseConnection' do
  it 'sets up connection to a database through PG' do
    expect(DatabaseConnection.setup('chitter_test')).to be_instance_of PG::Connection
  end
end
