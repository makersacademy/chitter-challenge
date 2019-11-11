require 'user'

describe User do
  subject(:user) { described_class.new('test@live.com', 'User123', 'SecretPassword321') }

  describe '#add' do
    it 'can add a new user' do
      expect(user.email).to eq 'test@live.com'
      expect(user.username).to eq 'User123'
      expect(user.password).to eq 'SecretPassword321'
    end
  end
end
