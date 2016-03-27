describe User do
  let(:user_c) { described_class }
  let!(:user) do
    user_details = {
      first_name: 'Bob',
      last_name: 'By',
      password: 'bobByg',
      email: 'bob.by@gmail.com'
    }
    user_c.create(user_details)
  end

  describe '#self.authenticate' do
    it 'authenticates a user' do
      aut_user = user_c.authenticate(email: user.email, password: 'bobByg')
      expect(aut_user).to eq user
    end
    it 'does not authenticate with bad login' do
      aut_user = user_c.authenticate(email: user.email, password: 'bobBg')
      expect(aut_user).to eq nil
    end
  end
end
