describe User do
  let!(:user) do
    User.create(username: 'test',
                name: 'Testy Smith',
                email: 'test@test.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end
end
