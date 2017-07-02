describe User do
  let!(:user) do
    User.create(username: 'Test', email: 'test@example.com', password: 'test123', password_confirmation: 'test123')
  end

  it 'authenticates the user when given valid info' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given the wrong info' do
    expect(User.authenticate(user.email, 'test321')).to be_nil
  end
end
