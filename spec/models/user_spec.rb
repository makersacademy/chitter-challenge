describe User do

  let!(:user) do
    User.create(email: 'david@example.com', password: 'password!',
               password_confirmation: 'password!')
  end

  describe '#self.authenticate' do
    it 'Authenticates when a correct email and password is given' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'Does not authenticate when an incorrect password is given' do
      expect(User.authenticate(user.email, 'wrong')).to be_nil
    end
  end
end
