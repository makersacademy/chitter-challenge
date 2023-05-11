require_relative '../lib/user_repository'
require_relative './spec_helper'
require 'bcrypt'

describe UserRepository do
  before(:each) do 
    reset_all_tables
  end

  it 'Returns all (2) users' do
    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq 2

    expect(users[0].id).to eq '1'
    expect(users[0].email).to eq 'samm@makersacademy.com'
    expect(users[0].name).to eq 'Sam Morgan'
    expect(users[0].username).to eq 'sjmog'

    expect(users[1].id).to eq '2'
    expect(users[1].email).to eq 'dkong@makersacademy.com'
    expect(users[1].name).to eq 'Donkey Kong'
    expect(users[1].username).to eq 'dkong'
  end

  it 'Finds user by id' do
    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq '1'
    expect(user.email).to eq 'samm@makersacademy.com'
    expect(user.name).to eq 'Sam Morgan'
    expect(user.username).to eq 'sjmog'
  end

  it 'Creates a new user' do
    new_user = User.new
    new_user.email = 'ppeach@makersacademy.com'
    new_user.password = 'princess456'
    new_user.name = 'Princess Peach'
    new_user.username = 'peach'
    repo = UserRepository.new
    repo.create(new_user)
    users = repo.all

    expect(users[-1].email).to eq 'ppeach@makersacademy.com'
    expect(users[-1].name).to eq 'Princess Peach'
    expect(users[-1].username).to eq 'peach'
  end

  it 'Finds user by email' do
    repo = UserRepository.new
    user = repo.find_by_email('dkong@makersacademy.com')

    expect(user.username).to eq 'dkong'
  end

  it 'Logs a user in if their email and password are correct' do
    new_user = User.new
    new_user.email = 'kboo@makersacademy.com'
    new_user.name = 'King Boo'
    new_user.username = 'kboo'
    new_user.password = 'boo123'

    users = UserRepository.new
    users.create(new_user)
    
    result = users.sign_in('kboo@makersacademy.com', 'boo123')

    expect(result).to eq true
  end

  it 'Fails if a user tries to log in with an incorrect email or password' do
    new_user = User.new
    new_user.email = 'kboo@makersacademy.com'
    new_user.name = 'King Boo'
    new_user.username = 'kboo'
    new_user.password = 'boo123'

    users = UserRepository.new
    users.create(new_user)
    
    result = users.sign_in('kboo@makersacademy.com', 'boo')

    expect(result).to eq false
  end

end
