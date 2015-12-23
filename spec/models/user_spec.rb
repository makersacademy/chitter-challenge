describe User do
  subject(:user) { described_class.new }

  describe '#password'
    it 'generates a hashed password and assigns to password_digest' do
      user.password=('password')
      expect(user.password_digest).not_to be_nil
    end
end
