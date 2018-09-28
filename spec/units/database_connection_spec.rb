require 'database_connection'

RSpec.describe DatabaseConnection do

  before(:each) { ENV['RACK_ENV'] = 'test' }

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

  it 'should respond to SQL queries to that database' do
    sql_query = 'SELECT name, username, email, password FROM users;'
    query_result = [
      { name: 'Billy', username: 'billy1', email: 'billy@mail.co.uk',
        password: 'password' },
      { name: 'Barry', username: 'barry1', email: 'barry@mail.co.uk',
        password: 'password' },
      { name: 'Berty', username: 'berty1', email: 'berty@mail.co.uk',
        password: 'password' }
    ]
    expect(subject.query(sql_query)).to eq query_result
  end
end
