describe User do

  let(:name) { 'J T Kirk' }
  let(:email) { 'JTK@test.com' }
  let(:user_name) { 'TheShat' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }

  subject(:user) { described_class.create(name: name, email: email, user_name: user_name, password: password, password_confirmation: password_confirmation) }

  describe "#password" do
    it 'Creates a hashed password' do
      allow(BCrypt::Password).to receive(:create) { 'hashed password' }
      user.password=password
      expect(user.password_digest).to eq 'hashed password'
    end
  end

end
