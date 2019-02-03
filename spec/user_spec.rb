describe User do
  before(:each) do
    User.create(username: 'tomd', email: 'testemail@email.com', password: 'password', name: 'Tom')
  end
  let(:duplicate_user) { User.create(username: 'tomd', email: 'testemail@email.com', password: 'diffpassword', name: 'Different name')}

  describe '#create' do
    it "doesn't allow duplicate usernames / emails to be entered" do
      duplicate_user
      expect(User.all[-2]).to eq nil
    end
  end

  describe 'users' do
    it 'has a username' do
      expect(User.all[0].username).to eq 'tomd'
    end
    it 'has a email' do
      expect(User.all[0].email).to eq 'testemail@email.com'
    end
    it 'has a password' do
      expect(User.all[0].password).to eq 'password'
    end
    it 'has a name' do
      expect(User.all[0].name).to eq 'Tom'
    end
  end

  describe '#self.authenticate' do
    it 'returns user instance if email and password are correct' do
      user = User.authenticate(email: 'testemail@email.com', password: 'password')
      expect(user).to be_a(User)
      expect(user.password).to eq 'password'
    end
    it "returns nil if email isn't correct" do
      user = User.authenticate(email: "wrong@email.com", password: 'password')
      expect(user).to eq nil
    end
    it "returns nil if password isn't correct" do
      user = User.authenticate(email: 'testemail@email.com', password: 'wrong')
      expect(user).to eq nil
    end
  end
end
