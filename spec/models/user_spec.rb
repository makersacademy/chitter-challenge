describe User do
  let!(:user) do
    User.create(email: 'user@user.com',
                password: 'pass',
                password_confirmation: 'pass')
  end

  it 'authenticates when valid login details are provided' do
    auth_user = User.authenticate(user.email, user.password)
    expect(auth_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end
end
