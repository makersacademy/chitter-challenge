describe User do
  let!(:user) do
    User.create(name: 'Robert',
                email: 'asdf@asdf.com',
                callsign: 'Rob-S',
                password: 'password',
                password_confirmation: 'password')
  end

  it 'authenticates user email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate with an incorrect password' do
    expect(User.authenticate(user.email, password: 'drowssap')).to be_nil
  end

end
