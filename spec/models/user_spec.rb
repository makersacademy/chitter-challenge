describe User do

  describe '#authenticate' do

    it 'authenticates when give a valid username and password' do
      user = create(:user)
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticates when given wrong password' do
      user = create(:user)
      expect(User.authenticate(user.email, 'wrong')).to be_nil
    end

    it 'does not authenticates when given wrong email' do
      user = create(:user)
      expect(User.authenticate('wrong', user.password)).to be_nil
    end

  end

end
