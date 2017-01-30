describe User do
  let!(:user) do
    User.create(email: 'joe@example.com',
                name: 'Joe Bloggs',
                username: 'BloggsyMalone',
                password: 'shoobydooby',
                password_confirmation: 'shoobydooby')
  end
  it 'authenticates when given a valid email/password combo' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
