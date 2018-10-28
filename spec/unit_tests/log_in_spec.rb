describe 'Log in' do

  it 'fails when user does not exist' do
    expect { User.log_in(username: 'inexistent username', password: 'a password') }.to raise_error "Invalid credentials"
  end

  it 'fails with non matching password' do
    User.sign_up(name: 'a name', email: 'an email', username: 'an existing username', password: 'correct password')

    expect { User.log_in(username: 'an existing username', password: 'wrong password') }.to raise_error "Invalid credentials"
  end

  it 'logs in with valid credentials' do
    User.sign_up(name: 'a name', email: 'an email', username: 'an existing username', password: 'correct password')

    user = User.log_in(username: 'an existing username', password: 'correct password')

    expect(user.id).to be > 0
    expect(user.name).to eq 'a name'
    expect(user.email).to eq 'an email'
    expect(user.username).to eq 'an existing username'
  end

end
