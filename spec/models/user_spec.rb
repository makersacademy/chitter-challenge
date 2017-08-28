describe User do
  let!(:user) do
    User.create(email: 'pug@gmail.com', name: 'Pug', username: '@puggy',
     password: 'password', password_confirmation: 'password')
  end

  it 'authenticates when given a vaid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

end
