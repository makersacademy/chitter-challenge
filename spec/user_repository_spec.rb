require 'user'
require 'user_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_tables
  end

  it 'creates a new user' do
    repo = UserRepository.new

    new_user = User.new
    new_user.name = "Chewbacca"
    new_user.username = "chewie123"
    new_user.email = "chewie123@gmail.com"
    new_user.password = "lightsaber"
    user = repo.create(new_user)

    expect(user.name).to eq "Chewbacca"
    expect(user.username).to eq "chewie123"
    expect(user.email).to eq "chewie123@gmail.com"
  end

  it 'finds a user by email' do
    repo = UserRepository.new
    user = repo.find_by_email('alice.smith@gmail.com')

    expect(user.id).to eq '1'
    expect(user.name).to eq 'Alice Smith'
    expect(user.username).to eq 'malice12'
  end

  it 'finds a user by id' do
    repo = UserRepository.new
    user = repo.find('1')

    expect(user.id).to eq '1'
    expect(user.name).to eq 'Alice Smith'
    expect(user.username).to eq 'malice12'
  end
end
