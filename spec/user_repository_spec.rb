require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds/user_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'users_test', user: 'jean', password: 'test123' })
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
    expect(users.first.name).to eq('name1')
  end

  it 'finds one user' do
    repo = UserRepository.new

    user = repo.find(fake@emai1.com)
    
    expect(user.id).to eq(1)
  end

end