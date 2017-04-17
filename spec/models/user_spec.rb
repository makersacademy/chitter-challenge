describe User do

  let!(:user) do
    User.create(username: "Magnus", email: "mail@magnusholm.com",
                password: "123banana",
                password_confirmation: "123banana")
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given incorrect password' do
    expect(User.authenticate(user.username, 'wrong_password')).to be_nil
  end

end
