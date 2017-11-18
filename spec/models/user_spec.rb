describe User do
  let!(:user) do
    User.create(username: 'bobby', email: 'bob@bobby.com', name: 'Bobby Thorn', password: '12345', password_confirmation: '12345')
  end

  it 'authenticates user when given valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate user when given wrong password' do
    authenticated_user = User.authenticate(user.username, 'wrong password')
    expect(authenticated_user).to eq nil
  end
end
