require 'user'
require 'user_repository'
require 'database_connection'

def reset_users_table
  seed_sql = File.read('spec/seeds/users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  it 'finds all users' do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq(2)
    expect(users.first.name).to eq('Joe Osborne')
  end

  it 'finds one user' do
    repo = UserRepository.new
    user = repo.find(2)
    expect(user.id).to eq(2)
    expect(user.name).to eq('Petyr Baelish')
  end

  it 'creates a user' do
    repo = UserRepository.new
    user = User.new
    user.name = 'Safiya Lambie-Knight'
    user.username = 'Sassy85'
    user.email = 'safiyalk@hotmail.co.uk'
    user.password = 'Adanerg123!!'
    repo.create(user)
    users = repo.all
    expect(users.length).to eq(3)
    expect(users.last.name).to eq('Safiya Lambie-Knight')
  end
end