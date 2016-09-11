describe User do
  let!(:user) do
    User.create(name: 'Struppi',
                username: 'struppi',
                email: 'struppi@test.com',
                password: 'beta',
                password_confirmation: 'beta')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
