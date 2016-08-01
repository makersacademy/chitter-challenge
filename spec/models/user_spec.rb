describe User do

  let!(:user) do
    User.create(username: 'xyz',
                password: 'pass',
                confirm_password: 'pass',
                name: 'sam',
                email: 'sam@example.com')
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an invalid username and password' do
    authenticated_user = User.authenticate(user.username, 'wrong')
    expect(authenticated_user).not_to eq user
  end

end
