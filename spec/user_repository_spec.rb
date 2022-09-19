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
    expect(users.first.password).to eq('$2a$12$V44T0Eq3xxxd23IsnMW62u9YB1QPxlmgjfI8k4qR8.p1XCDhbsNji')
    expect(users.first.f_name).to eq('Wendy')
    expect(users.first.handle).to eq('wendy0')
  end

  it '#find finds one user specified by email' do
    repo = UserRepository.new    
    user = repo.find_by_email('chandler0@example.com')
    
    expect(user.id).to eq(4)
    expect(user.email).to eq('chandler0@example.com')
    expect(user.password).to eq('$2a$12$z0bqmInOTFmO/6kHzCUvp.1IymcLnnvo02EWkGeabjy3WhIzBzKU2')
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
    expect(users.last.password).not_to eq('password123')
    expect(users.last.f_name).to eq('Rob')
    expect(users.last.handle).to eq('rob0')
  end

  it '#sign_in confirms user submitted password is valid (via BCrypt) based on encrypted password in database' do
    repo = UserRepository.new    
    user = User.new
    user.email = ('rob0@example.com')
    user.password = ('password123')
    user.f_name = ('Rob')
    user.handle = ('rob0')
    repo.create(user)

    result = repo.sign_in(user.email, user.password)
    expect(result).to eq("successful")
  end
end
