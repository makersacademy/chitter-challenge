describe User do

  let!(:user) do
    User.create(name: 'test',
                username: 'test',
                email: 'test@test.com',
                password: '1234',
                password_confirmation: '1234')
  end

  it 'authenticates a user when given correct username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq(user)
  end

  it 'does not authenticate with incorrect username' do
    expect(User.authenticate('wrong_username', user.password)).to eq nil
  end

  it 'does not authenticate with incorrect password' do
    expect(User.authenticate(user.username, 'wrong_password')).to eq nil
  end
end
