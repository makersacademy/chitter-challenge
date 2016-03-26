describe User do

  let!(:user) do
    User.create(email: SessionHelpers::EMAIL,
                username: SessionHelpers::USERNAME,
                name: SessionHelpers::NAME,
                password: SessionHelpers::PASSWORD,
                password_confirmation: SessionHelpers::PASSWORD)
  end

  describe '#authenticate' do
    it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end
    it 'fails to authenticates with invalid email address and password' do
      authenticated_user = User.authenticate(user.email, 'garbage')
      expect(authenticated_user).to eq nil
    end
  end
end
