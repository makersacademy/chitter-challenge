describe User do

  let!(:user) do
    User.create(username: 'Teeohbee',
                password: '12345678',
                name: 'Toby Clarke',
                email: 'toby@example.com',
                password_confirmation: '12345678')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
