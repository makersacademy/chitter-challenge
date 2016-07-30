describe User do
  let!(:user) do
    User.create(username: 'Leo',
                email: 'leo@test.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')

  end

  it 'authenticates if given a matching email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when not given matching email and password' do
    expect(User.authenticate(user.email, 'not_your_password')).to be_nil
  end

end
