describe User do
  context '::authenticate' do
    let!(:user) do
      User.create(name: 'Katie', username: 'KS', email: 'K@email.com', password: 'secret', password_confirmation: 'secret')
    end

    it 'authenticates a valid user' do
      authenticated_user = User.authenticate(user.username, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate an invalid user' do
      authenticated_user = User.authenticate(user.username, 'please')
      expect(authenticated_user).not_to eq user
    end
  end
end
