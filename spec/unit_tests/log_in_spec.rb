describe 'Log in' do

  it 'fails when user does not exist' do
    expect { User.log_in('inexistent username', 'a password') }.to raise_error "Invalid credentials"
  end

  it 'fails with non matching password' do
    User.sign_up('a name', 'an existing username', 'an email', 'correct password')

    expect { User.log_in('an existing username', 'wrong password') }.to raise_error "Invalid credentials"
  end

end
