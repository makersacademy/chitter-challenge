describe User do

  let!(:user) do
    User.create(first_name: 'Tony',
                last_name: 'Stark',
                email: 'tony.stark@starkindustries.com',
                password: 'jarvis',
                password_confirmation: 'jarvis',
                user_name: 'TDawg')
  end

  describe '.authenticate' do
    it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.email, 'veronica')).to be_nil
    end
  end

end
