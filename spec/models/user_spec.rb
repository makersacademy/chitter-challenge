describe User do

  let!(:user) { create_user }

  it 'authenticates with valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate with invalid password' do
    expect(User.authenticate(user.username, 'geheim')).to be_nil
  end
end
