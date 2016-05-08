describe User do
  let(:user) do
    User.create(email: 'hello@example.com', password: 'secret',
                password_confirmation: 'secret')
  end

  it 'authenticates when given login correctly' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when incorrect password' do
    expect(User.authenticate(user.email, 'hello')).to be_nil
  end
end