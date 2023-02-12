require 'user_repository'
require 'pg'
require 'user'
# require 'database_connection' RSPEC
require 'database_connection'
require 'bcrypt'

def reset_users_table
  seed_sql = File.read('spec/seeds/users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

RSpec.describe UserRepository do
  before(:each) do
    reset_users_table
    @repo = UserRepository.new
  end

  it 'retrieves all users' do
    expect(@repo.all.length).to eq 3
    expect(@repo.all.first.name).to eq 'user one'
    expect(@repo.all.last.name).to eq 'user three'
  end
end