require 'password_manager'

describe PasswordManager do

  describe '.hash' do
    it 'hashes a password' do
      test = PasswordManager.hash('password')
      expect(test).to_not eq('password')
    end
  end

  describe '.match_hash' do

    before(:each) do
      @hash = PasswordManager.hash('password')
    end

    it 'matches a valid password' do
      expect(PasswordManager.match_hash('password').to be true)
    end

    it 'rejects a fake password' do
      expect(PasswordManager.match_hash('fake').to_not be true)
    end
  end
end

