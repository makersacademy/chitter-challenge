describe UserPassword do
  let(:user) { double(:user) }
  describe '.set' do
    it 'sets the password and salt for the given user' do
      expect(user).to receive(:passhash=)
      expect(user).to receive(:salt=)
      UserPassword.create(user, "Password")
    end
  end
  
  describe '.check' do
    context 'given the correct password' do
      it 'returns true' do
        salt = BCrypt::Engine.generate_salt
        passhash = BCrypt::Engine.hash_secret("password", salt)
        result = UserPassword.check(password: "password", salt: salt, passhash: passhash)
        expect(result).to be true
      end
    end

    context 'given an incorrect password' do
      it 'returns false' do
        salt = BCrypt::Engine.generate_salt
        passhash = BCrypt::Engine.hash_secret("password", salt)
        result = UserPassword.check(password: "wrong password", salt: salt, passhash: passhash)
        expect(result).to be false
      end
    end
  end
end