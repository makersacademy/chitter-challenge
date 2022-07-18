require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_directory_test' })
  connection.exec(seed_sql)
end
  
describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  it 'returns all users' do
    repo = UserRepository.new
    
    users = repo.all
    expect(users.length).to eq 3
    
    expect(users[0].id).to eq 1
    expect(users[0].name).to eq 'name 1'
    expect(users[0].username).to eq 'username_1'
    expect(users[0].email).to eq 'test1@email.com'
    expect(users[0].password).to eq 'password123'
    
    expect(users[1].id).to eq 2
    expect(users[1].name).to eq 'name 2'
    expect(users[1].username).to eq 'username_2'
    expect(users[1].email).to eq 'test2@email.com'
    expect(users[1].password).to eq 'password234'
    
    expect(users[2].id).to eq 3
    expect(users[2].name).to eq 'name 3'
    expect(users[2].username).to eq 'username_3'
    expect(users[2].email).to eq 'test3@email.com'
    expect(users[2].password).to eq 'password345'
  end
  
  it "returns a single user by id" do 
    repo = UserRepository.new
    user = repo.find(1)
    
    expect(user.id).to eq 1
    expect(user.name).to eq 'name 1'
    expect(user.username).to eq 'username_1'
    expect(user.email).to eq 'test1@email.com'
  end

  it "returns a single user by username" do 
    repo = UserRepository.new
    user = repo.find_username('username_1')
    
    expect(user.id).to eq 1
    expect(user.name).to eq 'name 1'
    expect(user.username).to eq 'username_1'
    expect(user.email).to eq 'test1@email.com'
  end

  it "returns a single user by email" do 
    repo = UserRepository.new
    user = repo.find_email('test1@email.com')
    
    expect(user.id).to eq 1
    expect(user.name).to eq 'name 1'
    expect(user.username).to eq 'username_1'
    expect(user.email).to eq 'test1@email.com'
  end
  
  it "adds a new user to database" do
    repo = UserRepository.new

    user = User.new
    user.name = 'Marie'
    user.username = 'ma_rie'
    user.email = 'test4@email.com'
    user.password = 'password456'
    repo.create(user)
    
    users = repo.all
    expect(users.length).to eq 4
    expect(users.last.username).to eq 'ma_rie'
    expect(users.last.email).to eq 'test4@email.com'
    expect(users.last.password).to eq 'password456'
  end

  it "updates the username" do
    repo = UserRepository.new
    repo.update(2, 'username', 'del_m')

    users = repo.all
    expect(users[1].id).to eq 2
    expect(users[1].name).to eq 'name 2'
    expect(users[1].username).to eq 'del_m'
    expect(users[1].email).to eq 'test2@email.com'
    expect(users[1].password).to eq 'password234'
  end
  
  it 'deletes a user' do
    repo = UserRepository.new
    
    user = User.new
    user.name = 'Marie'
    user.username = 'ma_rie'
    user.email = 'test4@email.com'
    user.password = 'password456'
    repo.create(user)
    
    users = repo.all
    expect(users.length).to eq 4

    repo.delete(4)
    users = repo.all
    expect(users.length).to eq 3
    expect(users.last.id).to eq 3
  end
end
