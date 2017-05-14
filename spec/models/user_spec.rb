describe User do

  let!(:user) do
    User.create(email: 'test@test.com', password: 's3cr3t',
                password_confirmation: 's3cr3t', name: 'test',
                username: 'Test')
  end

  it 'authenticates when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
end
