describe User do

  let!(:user) do
    User.create(name: 'will', email: 'test@test.com', user_name: 'will', password: 'secret1234',
    confirm_password: 'secret1234')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrongpw')).to be_nil
  end

end
