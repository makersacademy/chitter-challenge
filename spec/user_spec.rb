describe User do

  let!(:user) do
    User.create(name: 'user', username: 'user1234',
                email: 'user@example.com', password: '1234',
                password_confirmation: '1234')
  end

  it 'authenticates with valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does\'t authenticate with an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end

end
