describe 'User' do
  let!(:user) do
    User.create(email: 'test@example.com', password: 'pass',
    password_confirmation: 'pass')
  end
  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticates when given an incorrect password' do
    authenticated_user = User.authenticate(user.email, 'wrong')
    expect(authenticated_user).to be_nil
  end

end
