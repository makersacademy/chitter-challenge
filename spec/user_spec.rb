describe User do
  let!(:user) do
    User.create(name: 'Sample', email: 'sample@email.com',
      username: 'sample1235', password: 'password1234',
      password_confirmation: 'password1234')
  end

  it 'authenticates when a valid username and password are entered' do
    correct_user = User.authenticate(user.username, user.password)
    expect(correct_user).to eq user
  end

  it 'does not authenticate with incorrect password' do
    expect(User.authenticate(user.username, "something wrong")).to be_nil
  end
end