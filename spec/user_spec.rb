describe User do

  let(:name) { 'J T Kirk' }
  let(:email) { 'JTK@test.com' }
  let(:user_name) { 'TheShat' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }

  let(:user) { described_class.create(name: name, email: email, user_name: user_name, password: password, password_confirmation: password_confirmation) }

  describe "#password" do
    it 'Creates a hashed password' do
      allow(BCrypt::Password).to receive(:create) { 'hashed password' }
      user.password=password
      expect(user.password_digest).to eq 'hashed password'
    end
  end

  describe "#self.authenticate" do
    before(:each) do
      User.create(name: name, email: email, user_name: user_name, password: password, password_confirmation: password_confirmation)
    end

    it 'authenticates when gives a valid email and password' do
      user = User.first(email: email)
      authenticated_user = described_class.authenticate(email, password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate when gives a wrong password' do
      authenticated_user = described_class.authenticate(email, "wrongpassword")
      expect(authenticated_user).to be nil
    end
  end

end
