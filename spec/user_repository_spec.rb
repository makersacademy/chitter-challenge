require_relative '../lib/user'
require_relative '../lib/user_repository'

def reset_tables
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_tables
  end
  after(:each) do
    reset_tables
  end

  it 'lists all users' do

    repo = UserRepository.new

    users = repo.all
    expect(users.length).to eq 5
    expect(users.first.username).to eq 'brugalheimer'
    expect(users.last.email).to eq 'chad@gmail.com'
  end

  it 'adds a new user' do
    repo = UserRepository.new
    users = repo.all
  
    expect(users.length).to eq 5
    expect(users.last.username).to eq 'chad_has_seen_this'
  
    new_user = User.new
    new_user.username = 'peymansimon'
    new_user.email = 'peyman@gmail.com'
    new_user.password = 'password6'
    repo.signup(new_user)
    updated_users = repo.all
  
    expect(updated_users.length).to eq 6
    expect(updated_users.last.username).to eq 'peymansimon'
    expect(updated_users.last.email).to eq 'peyman@gmail.com'
  end

  it 'validates a valid sign-in request' do
    repo = UserRepository.new
    user = repo.check_valid_user('brugalheimer', 'password')
    expect(user.username).to eq 'brugalheimer'
  end
end
