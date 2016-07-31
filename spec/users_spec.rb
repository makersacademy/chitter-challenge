describe User do
  let!(:user) do
    User.create(username: 'luke', name: 'luke', email: 'luke@lukecartledge.com', password: 'ABC123', password_confirmation: 'ABC123')
  end

  context '#authenticate' do
    it 'authenticates user when given a valid username and password' do
      authenticated_user = User.authenticate(user.username, user.password)
      expect(authenticated_user).to eq user
    end
    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.username, 'not_abc123')).to be_nil
    end
  end
end
