describe UserPassword do
  let(:user) { double(:user, id: 1) }
  describe '.set' do
    it 'sets the password and salt for the given user' do
      user = User.create(name: "name", handle: "handle")
      user_password = UserPassword.set(user, "Password")
      expect(user_password.passhash).to be_a(String)
      expect(user_password.salt).to be_a(String)
      expect(user_password.user_id).to eq user.id
    end
  end
  
  describe 'check' do
    context 'given the correct password' do
      it 'returns true' do
        user = User.create(name: "name", handle: "handle")
        user_password = UserPassword.set(user, "Password")
        expect(user_password.check('Password')).to be true
      end
    end

    context 'given an incorrect password' do
      it 'returns false' do
        user = User.create(name: "name", handle: "handle")
        user_password = UserPassword.set(user, "Password")
        expect(user_password.check('wrong password')).to be false
      end
    end
  end
end