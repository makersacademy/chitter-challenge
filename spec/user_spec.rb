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

    it 'returns nil if passed an invalid password' do
      user = User.authenticate(username: 'fredders99',
                               password: 'not_my_password')
      expect(user).to be_nil
    end

    it "returns nil if passed a username that doesn't exist" do
      user = User.authenticate(username: 'not_a_username',
                               password: 'my_password')
      expect(user).to be_nil
    end
  end
end
