require 'database_connection'

RSpec.describe DatabaseConnection do

  before(:each) { ENV['ENVIRONMENT'] = 'test' }

  it 'should connect to a database' do
    expect(subject.connection).to_not eq nil
  end

  it 'should connect to the development database in development' do
    ENV['ENVIRONMENT'] = 'development'
    development_connection = described_class.new
    expect(development_connection.connection.db).to eq 'chitter'
  end

  xit 'should connect to the production database in production' do
    ENV['ENVIRONMENT'] = 'production'
    production_connection = described_class.new
    expect(production_connection.connection.db).to eq 'chitter_production'
  end

  it 'raises an error if it is in an unknown environment' do
    ENV['ENVIRONMENT'] = 'unknown'
    expect { described_class.new }.to raise_error 'No database environment specified'
  end

  it 'should allow us to send SQL queries to that database' do
    connection = subject.connection
    expect(connection).to receive(:exec).with("SELECT * FROM peeps;")

    subject.query("SELECT * FROM peeps;")
  end
end
