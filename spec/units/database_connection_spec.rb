require 'database_connection'

RSpec.describe DatabaseConnection do

  before(:each) do
    ENV['RACK_ENV'] = 'test'
    DatabaseConnection.setup
    initialize_test_database
  end

  it 'should connect to the development database in development' do
    ENV['RACK_ENV'] = 'development'
    DatabaseConnection.setup
    expect(DatabaseConnection.db).to eq 'chitter'
  end

  it 'raises an error if it is in an unknown environment' do
    ENV['RACK_ENV'] = 'unknown'
    error_message = 'No database environment specified'
    expect { DatabaseConnection.setup }.to raise_error error_message
  end

  it 'responds to SQL queries to that database (not including passwords)' do
    sql_query = 'SELECT name, username, email FROM users;'
    query_result = [
      { name: 'Billy', username: 'billy1', email: 'billy@mail.com' },
      { name: 'Barry', username: 'barry1', email: 'barry@mail.com' },
      { name: 'Berty', username: 'berty1', email: 'berty@mail.com' }
    ]
    encrypted_result = DatabaseConnection.query(sql_query)
    expect(query_comparer(encrypted_result, query_result)).to eq true
  end

  it 'should correctly return encrypted passwords' do
    sql_query = 'SELECT password FROM users;'
    query_result = [
      { password: 'password' },
      { password: 'password' },
      { password: 'password' }
    ]
    encrypted_result = DatabaseConnection.query(sql_query)
    expect(bcrypt_comparer(encrypted_result, query_result)).to eq true
  end
end
