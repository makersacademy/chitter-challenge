describe User do
  let!(:user) do
    User.create(email: 'vero@test.com', password: 'password')
  end

  it 'authenticates when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
  
end
