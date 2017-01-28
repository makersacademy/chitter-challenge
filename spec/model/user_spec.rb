describe User do

  let!(:user) do
    User.create(email: 'test@example.com', password: 'test123',
                password_confirmation: 'test123')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'Wrong_password')).to be_nil
  end

end
