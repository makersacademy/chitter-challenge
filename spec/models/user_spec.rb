describe User do

  let!(:user) do
    User.create(email: 'natalie@gmail.com', password: '1234', password_confirmation: '1234', name: 'Natalie', username: 'Natso')
  end

  it 'authenticates when given a valid password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be nil
  end
end