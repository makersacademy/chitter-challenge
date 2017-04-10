describe User do
  let!(:user) do
    User.create(name: 'Pete Smith', email: 'test@test.com', username: 'petey123', password: 'password123', password_confirmation: 'password123')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an invalid login' do
    expect(User.authenticate(user.email, 'notarealpassword')).to be_nil
  end
end
