describe User do

  let!(:user) do
    User.create(email: 'james@example.com',name: 'James', user_name: 'JamesX', password: 'oranges!', password_confirmation: 'oranges!')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid')).to be_nil
  end
end
