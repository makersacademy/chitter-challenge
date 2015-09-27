describe User do

  let(:user) do
    User.create(email: 'alice@example.com', password: '12345678', password_confirmation: '12345678')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
end
