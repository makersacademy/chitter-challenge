describe User do
  let!(:user) do
    User.create(email: 'james@example.com', password: 'password1',
                password_confirmation: 'password1')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
end
