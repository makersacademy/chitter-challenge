describe User do

  let!(:user) do
    User.create(email: 'john@aol.com', firstname: 'jonafan', lastname: 'lao', username: 'mika', password: 'mypassword',
               password_confirmation: 'mypassword')
  end

  it 'returns a user when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not return a user when given an incorrect password' do
    expect(User.authenticate(user.email, 'notmypassword')).to be_nil
  end

end
