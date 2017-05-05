describe User do
  let!(:user) do
    User.create(name: "Sophie",
      username: "sophie",
      email: 'sophie@example.com',
      password: "password",
      password_confirmation: "password")
  end
  it 'authenticates when given registered user details' do
    authenticate_user = User.authenticate(user.username, "password")
    expect(authenticate_user).to eq user
  end
  it 'does not authenticate user when given wrong password' do
    authenticate_user = User.authenticate(user.username, "error")
    expect(authenticate_user).to be_nil
  end
end
