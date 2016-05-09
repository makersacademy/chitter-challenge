describe User do

  let!(:user) do
    User.create(name: 'Marley',
                username: 'Luni',
                email: 'marley@cat.com',
                password: 'dreamies',
                password_confirmation: 'dreamies')
  end

  it 'authenticates when given valid details' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticat when given an incorrect password' do
    expect(User.authenticate(user.username, 'wrong_password')).to be_nil
  end
end
