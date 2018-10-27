describe 'Log in' do

  it 'fails when user does not exist' do
    expect { User.log_in('inexistent username', 'a password') }.to raise_error "Invalid credentials"
  end

  it 'fails with non matching password' do
    User.sign_up('a name', 'an email', 'an existing username', 'correct password')

    expect { User.log_in('an existing username', 'wrong password') }.to raise_error "Invalid credentials"
  end

  it 'logs in with valid credentials' do
    User.sign_up('a name', 'an email', 'an existing username', 'correct password')

    user = User.log_in('an existing username', 'correct password')

    expect(user.id).to be > 0
    expect(user.name).to eq 'a name'
    expect(user.email).to eq 'an email'
    expect(user.username).to eq 'an existing username'
  end

end
