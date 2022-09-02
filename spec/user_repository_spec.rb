require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_testing' })
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
    expect(users[0].name).to eq 'Moe'
    expect(users[0].username).to eq 'moeez'
    expect(users[0].email).to eq 'moeez@gmail.com'
    expect(users[0].password).to eq 'strong123'
    
    expect(users[1].id).to eq 2
    expect(users[1].name).to eq 'Joe'
    expect(users[1].username).to eq 'joeez'
    expect(users[1].email).to eq 'joeez@gmail.com'
    expect(users[1].password).to eq 'weak123'
    
    expect(users[2].id).to eq 3
    expect(users[2].name).to eq 'Foe'
    expect(users[2].username).to eq 'foeez'
    expect(users[2].email).to eq 'foeez@gmail.com'
    expect(users[2].password).to eq 'wicked123'
  end
  
  it "returns a single user by id" do 
    repo = UserRepository.new
    user = repo.find(1)
    
    expect(user.id).to eq 1
    expect(user.name).to eq 'Moe'
    expect(user.username).to eq 'moeez'
    expect(user.email).to eq 'moeez@gmail.com'
  end

  it "returns a single user by username" do 
    repo = UserRepository.new
    user = repo.find_username('joeez')
    
    expect(user.id).to eq 2
    expect(user.name).to eq 'Joe'
    expect(user.username).to eq 'joeez'
    expect(user.email).to eq 'joeez@gmail.com'
  end

  it "returns a single user by email" do 
    repo = UserRepository.new
    user = repo.find_email('joeez@gmail.com')
    
    expect(user.id).to eq 2
    expect(user.name).to eq 'Joe'
    expect(user.username).to eq 'joeez'
    expect(user.email).to eq 'joeez@gmail.com'
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
    repo.update_username(2, 'poser')

    users = repo.all
    expect(users[1].id).to eq 2
    expect(users[1].username).to eq 'poser'
  end

  it 'updates the name' do
    repo = UserRepository.new
    repo.update_name(2, 'Poe')

    users = repo.all
    expect(users[1].id).to eq 2
    expect(users[1].name).to eq 'Poe'
  end
  
  it 'updates the email' do
    repo = UserRepository.new
    repo.update_email(2, 'poe222@gmail.com')

    users = repo.all
    expect(users[1].id).to eq 2
    expect(users[1].email).to eq 'poe222@gmail.com'
  end
  
  it 'updates the password' do
    repo = UserRepository.new
    repo.update_password(2, 'picker11')

    users = repo.all
    p users
    expect(users[1].id).to eq 2
    expect(users[1].password).to eq 'picker11'
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