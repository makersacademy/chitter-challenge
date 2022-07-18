require 'user_repository'
require 'user'
require 'bcrypt'

RSpec.describe UserRepository do

  before(:each) do
    DatabaseConnection.exec(File.read('./seeds/users_seeds.sql'))
  end 

  it 'returns all users' do
    repo = UserRepository.new
    expect(repo.all[0]).to have_attributes({username: 'shaunho'})
    expect(repo.all[1]).to have_attributes({username: 'hoshaun'})

  end 

  it 'creates a new user' do 
    user = entry_to_user('shaunhohoho@gmail.com', 'shaunhohoho', 'shaunhohoho')
    repo = UserRepository.new
    returned_id = repo.create(user)
    returned_user = repo.all[-1]
    expect(returned_user.email).to eq 'shaunhohoho@gmail.com'
    expect(returned_user.username).to eq 'shaunhohoho'
    expect(BCrypt::Password.new(returned_user.password)).to eq 'shaunhohoho'
    expect(returned_id). to eq 3
    expect(returned_user.id).to eq 3

  end 

  it 'finds a valid user by username' do
    repo =UserRepository.new
    user = repo.find_by_username('shaunho')
    expect(user.username).to eq 'shaunho'
    expect(user.id).to eq 1
  end 

  it 'returns nil when finding an invalid user by username' do
    repo =UserRepository.new
    user = repo.find_by_username('shaunhoho')
    expect(user).to eq nil
  end 

  it 'returns true for a valid login' do
    user = entry_to_user('testemail', 'shaunhohoho', 'shaunhohoho')
    repo = UserRepository.new
    repo.create(user)
    expect(repo.login('shaunhohoho', 'shaunhohoho')).to eq 3
  end 

  it 'returns false for an invalid login' do
  user = entry_to_user('testemail', 'shaunhohoho','shaunhohoho')
  repo = UserRepository.new
  repo.create(user)
  expect(repo.login('shaunhohoho', 'shaunhoho')).to eq nil
end 



  it 'signs a valid user up' do
    repo = UserRepository.new
    id = repo.sign_up('shaunhohoho@gmail.com','shaunhoho', 'shaunhoho')
    expect(id).to eq 3
  end 

  it 'returns nil when an invalid user is signed up' do
    repo = UserRepository.new
    id = repo.sign_up('shaunhohoho@gmail.com','shaunho', 'shaunho')
    expect(id).to eq nil 
  end 



  def entry_to_user(email, username, password)
    user = User.new
    user.email = email
    user.username = username
    user.password = password
    return user
  end 


end 
