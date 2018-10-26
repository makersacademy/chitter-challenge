require './lib/user'
require 'pry'

describe User do

  it 'adds a new user' do
    User.add(username: 'Becka', email: 'notarealemail12345@hotmail.co.uk', password: 'fakepassword')
    users = User.all
    expect(users.first.username).to eq 'Becka'
  end

  it 'adds multiple users' do
    User.add(username: 'Becka', email: 'notarealemail12345@hotmail.co.uk', password: 'fakepassword')
    User.add(username: 'Bex', email: 'anotherfakeemail12345@hotmail.co.uk', password: 'fakepassword')
    users = User.all
    expect(users.first.username).to eq 'Becka'
    expect(users.last.username).to eq 'Bex'
  end

  it 'cannot add users with the same username' do
    User.add(username: 'Becka', email: 'notarealemail12345@hotmail.co.uk', password: 'fakepassword')
    expect{User.add(username: 'Becka', email: 'anotherfakeemail12345@hotmail.co.uk', password: 'fakepassword')}.to raise_error 'Username already taken'
  end


end
