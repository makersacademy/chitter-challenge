describe User do

    # I remember not being able to use a factory here
  let!(:user) do
      User.create(email: 'tests@user.it', password: 'secret', password_confirmation: 'secret', username: 'user123', name: 'name')
  end

  it 'authenticates at login with correct credentials' do
    authenticated = User.authenticate(user.email, user.password)
    expect(authenticated).to eq user
  end

  it 'does not authenticate with incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end

end
