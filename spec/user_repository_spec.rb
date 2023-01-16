require 'user'
require 'user_repository'

def reset_tables
    seed_sql = File.read('spec/seeds/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end 

describe UserRepository do 
  before(:each) do 
    reset_tables
  end 

  it "returns a list of users" do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq(7)
    expect(users[0].username).to eq('alice') 
  end
  
  it "returns the users who matches the search criterion (id)" do 
    repo = UserRepository.new
    user = repo.find(1)
    expect(user.id).to eq(1)
    expect(user.email_address).to eq('alice@email.com')
  end
  it "returns the user who matches the search criterion (username)" do 
    repo = UserRepository.new
    user = repo.find_user('bob')
    expect(user.id).to eq(2)
    expect(user.username).to eq('bob')
    expect(user.email_address).to eq('bob@email.com')
  end

  it "creates a new user" do 
    repo = UserRepository.new
    new_user = User.new
    new_user.username = 'peeper'
    new_user.email_address = 'peeper@email.com'
    repo.create(new_user)
    users = repo.all
    expect(users.length).to eq(8)
    expect(users.last.username).to eq('peeper')
  end
end 