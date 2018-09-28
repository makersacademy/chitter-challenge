require 'database_connection'

RSpec.describe DatabaseConnection do

  before(:each) do
    ENV['RACK_ENV'] = 'test'
    initialize_test_users
  end

  it 'should connect to the development database in development' do
    ENV['RACK_ENV'] = 'development'
    development_connection = described_class.new
    expect(development_connection.db).to eq 'chitter'
  end

  xit 'should connect to the production database in production' do
    ENV['RACK_ENV'] = 'production'
    production_connection = described_class.new
    expect(production_connection.db).to eq 'chitter_production'
  end

  it 'raises an error if it is in an unknown environment' do
    ENV['RACK_ENV'] = 'unknown'
    expect { described_class.new }.to raise_error 'No database environment specified'
  end

  it 'responds to SQL queries to that database (not including passwords)' do
    sql_query = 'SELECT name, username, email FROM users;'
    query_result = [
      { name: 'Billy', username: 'billy1', email: 'billy@mail.com' },
      { name: 'Barry', username: 'barry1', email: 'barry@mail.com' },
      { name: 'Berty', username: 'berty1', email: 'berty@mail.com' }
    ]
    expect(query_comparer(subject.query(sql_query), query_result)).to eq true
  end

  it 'should correctly return encrypted passwords' do
    sql_query = 'SELECT password FROM users;'
    query_result = [
      { password: 'password' },
      { password: 'password' },
      { password: 'password' }
    ]
    expect(bcrypt_comparer(subject.query(sql_query), query_result)).to eq true
  end
end
