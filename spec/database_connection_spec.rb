require 'database_connection'

describe 'database_connection' do
  it 'connection is persistent' do
    connection = DatabaseConnection.setup('chitter_test')
    expect(DatabaseConnection.connection).to eq connection
  end
end
