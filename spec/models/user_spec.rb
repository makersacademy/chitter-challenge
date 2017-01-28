describe User do

  let!(:user) do
    User.create(email: 'ben@ben.com', password: 'ben123',password_confirmation: 'ben123')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

end
