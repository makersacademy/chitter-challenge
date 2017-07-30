describe User do
  let!(:user) do
    User.create(name: 'Anna', nickname: 'xx1xx', email: 'ana@ana.com', password: '1234',
               password_confirmation: '1234')
  end

  it 'authenticates when given a valid nickname and password' do
    authenticated_user = User.authenticate(user.nickname, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.nickname, 'wrong_stupid_nickname')).to be_nil
  end

end
