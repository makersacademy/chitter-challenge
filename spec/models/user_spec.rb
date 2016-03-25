describe User do

  let!(:user) do
    User.create(email: 'terry@fuckwit.com', password: 'password', password_confirmation: 'password')
  end

  describe '#authenticate' do
    it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end
    it 'fails to authenticates when given an invalid email address and password' do
      authenticated_user = User.authenticate(user.email, 'garbage')
      expect(authenticated_user).to eq nil
      p User.instance_variables
    end
  end
end
