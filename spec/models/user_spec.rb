describe User do

  let!(:user) do
    User.create(email: 'ruan@email.com',
                password: 's3cr3t',
                password_confirmation: 's3cr3t',
                name: 'Ruan',
                user_name: 'ruan')
  end

  describe '#authenticate' do
    it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate user if password is incorrect' do
      non_authenticated_user = User.authenticate(user.email, 'incorrect')
      expect(non_authenticated_user).to be_nil
    end
  end
end
