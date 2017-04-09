describe User do

  let!(:user) do
    User.create(email: 'a@gmail.com', password: '1234', password_confirmation: '1234')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given a wrong password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
