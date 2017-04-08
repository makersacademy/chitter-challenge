describe User do

  let!(:user) do
    User.create(email: 'test@test.com', password: '123',
                password_confirmation: '123')
  end

  it 'authenticates when given valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, "12")).to be_nil
  end
end