describe User do
  let(:user) do
    User.create(name: 'First User',
            username: 'number1',
            email: 'user@email.com',
            password: 'terriblepassword1',
            password_confirmation: 'terriblepassword1')
  end
  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end


end

