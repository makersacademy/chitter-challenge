require 'user'

describe User do
  subject(:user) {described_class.new('Ryan Clark', 'Email@email.com', 'Wolfen7Lada', 'Password') }

  describe '#Init' do
    it 'should return a name' do
      expect(user.name).to eq "Ryan Clark"
    end
    it 'should return an email' do
      expect(user.email).to eq "Email@email.com"
    end
    it 'should return an username' do
      expect(user.user_name).to eq "Wolfen7Lada"
    end
    it 'should return a password' do
      expect(user.password).to eq "Password"
    end
  end


end
