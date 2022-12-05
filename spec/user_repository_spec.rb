require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds/chitter_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_users_table
  end

  it 'finds a user, given username' do

    repo = UserRepository.new
    user = repo.find_by_username('JCMorgan')

    expect(user.name).to eq('JC Morgan')
    expect(user.username).to eq('JCMorgan')
    expect(user.email).to eq('JCMfakeemail@email.com')
    expect(user.password).to eq('$2a$12$wBqMt0dl7z1Y8oznseeE/eXl9LrpE307w.YnpQ3ao5fr7NnvMUicW')

  end

  it 'creates a user' do

    repo = UserRepository.new

    new_user = User.new
    new_user.name = 'Anne Bright'
    new_user.username = 'IDontKnow'
    new_user.email = 'ABfakeemail9873@email.com'
    new_user.password = 'FakePassword43&'
    repo.create(new_user)

    users = repo.all

    expect(users.length).to eq(3)
    expect(users.last.name).to eq('Anne Bright')
    expect(users.last.username).to eq('IDontKnow')
    expect(users.last.email).to eq('ABfakeemail9873@email.com')

  end

end
