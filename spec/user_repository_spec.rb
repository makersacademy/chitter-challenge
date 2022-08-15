require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds/users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter-challenge' })
  connection.exec(seed_sql)
end 

describe UserRepository do
  before(:each) do 
      reset_users_table
  end
  it 'returns all users'do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq(2)
    expect(users.first.name).to eq("sara")
  end


  it ' find specific user' do
    repo = UserRepository.new

    user = repo.find(2)
    expect(user.id).to eq(2)
  end

  it 'creates a new user' do
    repo = UserRepository.new

    user = User.new
    user.name = 'nelma'
    user.email = 'nelma@gmail.com'
    repo.create(user)

    users = repo.all

    expect(users.length).to eq(3)
    expect(users.last.name).to eq('nelma')

  end
end


