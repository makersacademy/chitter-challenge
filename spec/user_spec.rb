describe User do
  before(:each) do
    User.create(username: 'tomd', email: 'testemail@email.com', password: 'password', name: 'Tom')
  end
  let(:duplicate_user) { User.create(username: 'tomd', email: 'testemail@email.com', password: 'diffpassword', name: 'Different name') }
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

  describe '#self.check_users' do
    let(:new_user) { User.create(username: 'user2', email: 'testemail2@email.com', password: 'password', name: 'Tom') }
    let(:new_user3) { User.create(username: 'user3', email: 'testemail3@email.com', password: 'password', name: 'Tom') }
    let(:emailer) { double(:emailer, send_email: nil) }
    let(:peep) { double(:peep, content: 'Hello @tomd', user_id: new_user.id) }
    context 'passed one valid tag' do
      it 'passes content, user_id(of peeper) and email to email sender' do
        expect(emailer).to receive(:send_email).with(to: 'testemail@email.com', peeper: 'user2', content: peep.content)
        User.check_users(tags: ['tomd'], peep: peep, emailer: emailer)
      end
    end
    context 'passed two valid tags' do
      it 'asks emailer sender to send to both emails' do
        new_user3
        expect(emailer).to receive(:send_email).twice
        User.check_users(tags: ['tomd', 'user3'], peep: peep, emailer: emailer)
      end
    end
    context 'not passed a valid tag' do
      it "deosn't send message to emailer class" do
        expect(emailer).not_to receive(:send_email)
        User.check_users(tags: ['xxxxx'], peep: peep, emailer: emailer)
      end
    end
  end
end
