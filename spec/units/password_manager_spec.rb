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
      @hash = PasswordManager.hash('password')
    end

    it 'matches a valid password' do
      expect(PasswordManager.match_hash('password', @hash)).to be true
    end

    it 'rejects a fake password' do
      expect(PasswordManager.match_hash('fake', @hash)).to_not be true
    end
  end
end
