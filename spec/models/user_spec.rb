describe User do
  let!(:user) do
    User.create(user_name: 'samjbro',
                name: 'Sam Broughton',
                email: 'sam@email.com',
                password: '12345',
                password_confirmation: '12345')
  end

  it 'authenticates when given a valid email address and correct password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
  it 'does not authenticates when given an incorrect password' do
    authenticated_user = User.authenticate(user.email, 'wrong_password')
    expect(authenticated_user).to be_nil
  end

end