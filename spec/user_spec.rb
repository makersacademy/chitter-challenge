require 'user' 

describe User do
  it 'Users registers thei details' do
    user = User.create(name: 'Pingu Penguin', username: 'Pingu', email: 'pingu@penguin.co.uk', password: 'meepmoop')
    expect(user.name).to eq 'Pingu Penguin'
    expect(user.username).to eq 'Pingu'
    expect(user.email).to eq 'pingu@penguin.co.uk'
    expect(user.password).to eq 'meepmoop'
  end

  it 'hashes the password using BCrypt' do
    # is this test irrelevant because above test covers password?
    expect(BCrypt::Password).to receive(:create).with('meepmoop')
  
    User.create(name: 'Pingu Penguin', username: 'Pingu', email: 'pingu@penguin.co.uk', password: 'meepmoop')
  end

  it 'gives a users details if users email and password are correct' do
    user = User.create(name: 'Pingu Penguin', username: 'Pingu', email: 'pingu@penguin.co.uk', password: 'meepmoop')
    authenticated_user = User.authenticate(email: 'pingu@penguin.co.uk', password: 'meepmoop')
    expect(authenticated_user.username).to eq user.username
  end
end