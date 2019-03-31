describe User do
  describe '.authenticate' do
    before do
      @user = User.create(name: 'Fred Smith',
                          username: 'fredders99',
                          email: 'fred@hotmail.com',
                          password: 'my_password')
    end

    it 'returns a user if passed valid credentials' do
      user = User.authenticate(username: 'fredders99',
                               password: 'my_password')
      expect(user).to be_a User
      expect(user.id).to eq @user.id
    end

    # what if invalid password?
    # what if multiple users with username?
    # what if no users with username?
  end
end
