require 'user'
require 'user_repository'
require_relative './reset_database_tables'

describe UserRepository do
  before(:each) do
    ResetDatabaseTables.new.reset
  end

  it '#all finds all users' do
    repo = UserRepository.new
    users = repo.all
    
    expect(users.length).to eq(8)
    expect(users.first.id).to eq(1)
    expect(users.first.email).to eq('wendy0@example.com')
    expect(users.first.password).to eq('password123')
    expect(users.first.f_name).to eq('Wendy')
    expect(users.first.handle).to eq('wendy0')
  end

  it '#find finds one user specified by handle' do
    repo = UserRepository.new    
    user = repo.find('chandler0')
    
    expect(user.id).to eq(4)
    expect(user.email).to eq('chandler0@example.com')
    expect(user.password).to eq('password123')
    expect(user.f_name).to eq('Chandler')
    expect(user.handle).to eq('chandler0')
  end

  it '#create creates a user' do
    repo = UserRepository.new
    user = User.new    
    user.email = ('rob0@example.com')
    user.password = ('password123')
    user.f_name = ('Rob')
    user.handle = ('rob0')
    repo.create(user)
    users = repo.all

    expect(users.length).to eq(9)
    expect(users.last.id).to eq(9)
    expect(users.last.email).to eq('rob0@example.com')
    expect(users.last.password).to eq('password123')
    expect(users.last.f_name).to eq('Rob')
    expect(users.last.handle).to eq('rob0')
  end
end
