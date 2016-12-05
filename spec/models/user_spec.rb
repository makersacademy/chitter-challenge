describe User do

  let!(:user) do
    User.create(email: 'test@pleasework.com', username: 'testing', password_method2: 'password', password_confirmation: 'password')
  end

  it 'authenticates when given the correct login detail' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
end
