describe User do
  let(:user) do
    User.create(
      email: 'elvis@gmail.com',
      password: 'Blue_Hawaii',
      password_confirmation: 'Blue_Hawaii'
    )
  end

  context 'Signing in' do
    it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.email, 'other_password')).to eq nil
    end
  end
end
