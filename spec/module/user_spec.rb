describe User do
  let!(:user) do
    User.create(username: 'octavian',
                password: '123',
                confirm_password: '123')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate('octavian', '123')
    expect(authenticated_user).to eq user
  end

  it 'fails if given a wrong password ' do
    expect(User.authenticate(user.username, 'totaly_wrong')).to be_nil
  end
end
