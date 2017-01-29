describe User do
  let!(:user) do
    User.create(name: 'name',
    username: 'user',
    email: 'test@test.com',
    password: 'password',
    password_conf: 'password')
  end

  it 'authenticates when given a valid email address and password' do
    auth_user = User.authenticate(user.email, 'password')
    expect(auth_user).to eq(user)
  end
end
