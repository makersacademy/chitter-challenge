describe User do
  let!(:user) do
    User.create(username: 'Test', email: 'test@example.com',
                password: '1234', password_confirmation: '1234')
  end

  it 'authenticates when given correct details' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.username, 'wrong_password')).to be_nil
  end
end
