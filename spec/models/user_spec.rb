describe User do

  !let(:user) do
    User.create(name: "Jane Smith",
                email: 'user@example.com',
                username: "janesmith",
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to(eq(user))
  end

  it 'does not authenticate when given incorrect details' do
    expect(User.authenticate(user.username, "wrong")).to(be_nil)
  end

end
