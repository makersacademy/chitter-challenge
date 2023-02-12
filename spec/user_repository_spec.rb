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

  it 'creates a new user with hashed password' do
    new_user = double :user, name:'user four', email:'user_four@gmail.com', pass_word:'password4', username:'user_four'
  
    @repo.create(new_user)
  
    expect(@repo.all.length).to eq 4
    expect(@repo.all.last.name).to eq 'user four'
  end
end