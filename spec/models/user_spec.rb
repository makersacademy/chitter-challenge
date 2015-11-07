describe User do

  let!(:user) do
    User.create(name: 'Ivan Sathianathan', username: 'ivan', email: 'ivan@test.com', password: '12345', password_confirmation: '12345')
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'incorrect_password')).to be_nil
  end
end
