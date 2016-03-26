describe User do
  let(:user) do
    User.create(username: 'user1',
                email: 'user1@email.com',
                password: '1234',
                password_confirmation: '1234')
  end

  it 'authenitcates when given valid credentials' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given invalid credentials' do
    expect(User.authenticate(user.username, 'wrong')).to be_nil
  end

end
