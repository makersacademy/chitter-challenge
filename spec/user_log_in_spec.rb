describe User do

  let!(:user) do
    User.create(email:'test@test.com', password:'pass123')
  end

  it 'authenticates an existing user email and password'do

    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate on incorrect password' do
      expect(User.authenticate(user.email, 'incorrectpassword')).to be_nil
  end

end
