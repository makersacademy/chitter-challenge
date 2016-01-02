describe User do
  let!(:user) do
    User.create(name: 'Name-Surname', username: 'nickname',
                email: 'test@email.com',
                password: 'secret_password',
                password_confirmation: 'secret_password')
  end

  describe '#self.authenticate' do
    it 'authenticates when given a valid email and password confirmation' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate when given a wrong password confirmation' do
      expect(User.authenticate(user.email, 'wrong_password')).to be nil
    end

    it 'does not authenticate whithout email' do
      expect(User.authenticate(nil, user.password)).to be nil
    end
  end
end
