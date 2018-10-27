require './lib/user'
require 'pry'

describe User do

  before do
    User.add(username: 'Becka', email: 'notarealemail12345@hotmail.co.uk', password: 'fakepassword')
  end

  it 'adds a new user' do
    users = User.all
    expect(users.first.username).to eq 'Becka'
  end

  it 'adds multiple users' do
    User.add(username: 'Bex', email: 'anotherfakeemail12345@hotmail.co.uk', password: 'fakepassword')
    users = User.all
    expect(users.first.username).to eq 'Becka'
    expect(users.last.username).to eq 'Bex'
  end

  it 'cannot add users with the same username' do
    expect{User.add(username: 'Becka', email: 'anotherfakeemail12345@hotmail.co.uk', password: 'fakepassword')}.to raise_error 'Username already taken'
  end

  it 'cannot add users with the same email' do
    expect{User.add(username: 'Bex', email: 'notarealemail12345@hotmail.co.uk', password: 'fakepassword')}.to raise_error 'Email already taken'
  end

  it 'authenticates a log in' do
    expect(User.authenticate(username:'Becka', password:'fakepassword')).to eq true
  end

  it 'does not authenticate a log in with an incorrect password' do
    expect(User.authenticate(username:'Becka', password:'fakePassword')).to eq false
  end

  it 'does not authenticate a log in when user does not exist' do
    expect(User.authenticate(username:'Rebecca', password:'fakePassword')).to eq false
  end

end
