describe User do

  let!(:user) do
    User.create(name: "Test", email: "test@test.com",
                password: "password",
                password_confirmation: "password")
  end

  it 'authenticates a user when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate a user when given a valid email and invalid password' do
    unauthenticated_user = User.authenticate(user.email, "wrong password")
    expect(unauthenticated_user).to eq nil
  end
end
