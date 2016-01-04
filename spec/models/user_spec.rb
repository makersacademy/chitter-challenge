describe User do

  let!(:user) do
    User.create(name: 'user',
                username: 'userfoo',
                email: 'user@example.com',
                password: 'foobar',
                password_confirmation: 'foobar')
  end

  it 'authticates valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when provided with wrong password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

end
