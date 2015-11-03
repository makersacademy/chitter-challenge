require './app/models/user'

describe User do

  let(:user){create :user}

  describe '#authenticate' do

    it 'authenticates when give a valid username and password' do
      authenticated_user = User.authenticate(user.username, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticates when given wrong password' do
      authenticated_user = User.authenticate(user.username, 'wrong')
      expect(authenticated_user).to be_nil
    end

    it 'does not authenticates when given invalid username' do
      authenticated_user = User.authenticate('not_name', user.password)
      expect(authenticated_user).to be_nil
    end

  end

end
