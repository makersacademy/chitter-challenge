describe User do

  let!(:user) do
    User.create(email: 'newuser@gmail.com',
                password: 'password123',
                password_confirmation: 'password123',
                username: 'newnew',
                name: 'mew')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
  expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
end

end
