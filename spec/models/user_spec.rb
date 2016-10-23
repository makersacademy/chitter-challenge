require_relative '../../app/models/user'

describe User do
  let(:email) { 'maker@makers.com' }
  let(:password) { '000000' }
  let!(:user) do
    User.create(email: email, password: password)
  end

  describe '.authenticate' do
    it 'authenticates when given a valid email and password' do
      authenticated_user = User.authenticate(user.email, password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.email, 'wrong_password')).to be_nil
    end
  end

  describe '#peeps' do
    it 'allows access to user\'s peeps' do
      peep = Peep.create(
        body: 'Hello!',
        timestamp: Time.new,
        user: user
      )
      user.peeps.push(peep)
      expect(user.peeps.count).to eq 1
    end
  end
end
