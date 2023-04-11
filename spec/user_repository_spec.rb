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

    expect(user[0]).to eq "Chewbacca"
    expect(user[1]).to eq "chewie123"
    expect(user[2]).to eq "chewie123@gmail.com"
  end
end
