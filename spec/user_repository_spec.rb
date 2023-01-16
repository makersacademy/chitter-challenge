require 'user'
require 'user_repository'

def reset_tables
  seed_peeps_sql = File.read('spec/seeds_peeps.sql')
  seed_users_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_peeps_sql)
  connection.exec(seed_users_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_tables
  end

  # (your tests will go here).

  it 'finds all users' do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq 4
    expect(users.first.username).to eq ('Roger')
  end

  it 'creates new user' do
    repo = UserRepository.new
    new_user = User.new
    new_user.username = 'Alec'
    new_user.password = 'keyboard'
    new_user.user_email = 'alec@icloud.com'
    repo.create(new_user)
    expect(repo.all.length).to eq 5
    expect(repo.all.last.username).to eq ('Alec')
    expect(repo.all.last.user_email).to eq ('alec@icloud.com')
  end

  it 'finds one user by its id' do
    repo = UserRepository.new
    user = repo.find('1')
    expect(user.id).to eq(1)
    expect(user.username).to eq('Roger')
  end
end
