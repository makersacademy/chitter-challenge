describe User do
  let!(:user) do
    User.create(email: 'test@test.com', password: 'password',
                password_confirmation: 'password')
  end

  it 'authenticates when given valid credentials' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
