describe User do

  let!(:user) do
    User.create(email: 'test@test.com', password: 'secret1234')
  end

  it 'authenticates when given a valid email address and password' do
    DatabaseCleaner.start
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
    DatabaseCleaner.clean
  end

end
