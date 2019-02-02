require 'password_manager'

describe PasswordManager do

  describe '.hash' do
    it 'hashes a password' do
      password = 'password'
      hash = PasswordManager.hash(password)
      expect(password == hash).to be false
    end
  end

  describe '.match_hash' do

    before(:each) do
      @my_password = BCrypt::Password.create('my password')
    end

    it 'matches a valid password' do
      expect(PasswordManager.match_hash('my password', @my_password)).to be true
    end

    it 'rejects a fake password' do
      expect(PasswordManager.match_hash('fake', @my_password)).to_not be true
    end
  end
end

