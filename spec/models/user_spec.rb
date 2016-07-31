describe User do

  let!(:user) do
    User.create(username: 'bobsmith1',
                email: "bob@smith.com",
                name: "Bob Smith",
                password: 'password123',
                password_confirmation: 'password123')
  end

  it 'authenticates when user provides a valide username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end
end
