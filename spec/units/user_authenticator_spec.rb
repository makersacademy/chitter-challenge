require 'user_authenticator'

describe UserAuthenticator do
  describe '.validate' do
    it 'returns true for valid user' do
      expect(described_class.valid?('testusername', 'Password1')).to eq true
    end

    context 'invalid username' do
      it 'returns false' do
        expect(described_class.valid?('invalidusername', 'Password1')).to eq false
      end

      it 'calls valid_password?' do
        expect(described_class).to receive(:valid_username?)
        described_class.valid?('invalidusername', 'Password1')
      end
    end

    context 'valid username but invalid password' do
      it 'returns false for invalid password' do
        expect(described_class.valid?('testusername', 'wrongpassword')).to eq false
      end

      it 'calls valid_password?' do
        expect(described_class).to receive(:valid_password?)
        described_class.valid?('testusername', 'wrongpassword')
      end
    end
  end
end
