describe User do
  let!(:user) { create_test_user }

  it 'authenticates when given correct email and password' do
    authenticated = User.authenticate('testemail@example.com', 'password_duh')
    expect(authenticated).to eq user
  end

  it 'fails to authenticate when given incorrect password' do
    authenticated = User.authenticate('testemail@example.com', 'kittens')
    expect(authenticated).to be nil
  end
end
