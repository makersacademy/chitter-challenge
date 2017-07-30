describe User do

  let!(:user) do
    User.create(email: 'example@example.com', password: 'example',
                  password_confirmation: 'example')
  end
  it 'authenticates when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given incorrect password' do
    expect(User.authenticate(user.email, 'incorrect_password')).to be_nil
  end
end
