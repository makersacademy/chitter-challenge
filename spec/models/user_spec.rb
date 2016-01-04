describe User do
  let(:user) do
    User.create(
      name: 'Joe Bloggs',
      username: 'joeb',
      email: 'joe.bloggs@gmail.com', 
      password: 'jo3ble0bl3',
      password_confirmation: 'jo3ble0bl3'
    )
  end

  describe 'Authentication' do
    it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.username, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate user when given wrong password' do
      expect(User.authenticate(user.username, 'wrong password')).to be_nil
    end
  end
end
