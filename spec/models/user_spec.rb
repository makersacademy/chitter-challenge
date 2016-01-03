describe User do
  let!(:user) do
    User.create(name:                   'Mr Example',
                username:               '3xampl3',
                email:                  'example@example.com',
                password:               'qwerty',
                password_confirmation:  'qwerty')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.username, 'wrong')).to be_nil
  end
end
