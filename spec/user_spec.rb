require_relative '../app/models/user'

describe User do
  subject(:user) { described_class }
  describe '#authenticate' do
    before { @user = user.create(
              email: 'dave@dave.com',
              password: '12345',
              password_confirmation: '12345',
              username: 'Dave',
              name: 'Dave Davis')
            }
    it 'logs in user based off email' do
      expect(user.authenticate('dave@dave.com', '12345')).to eq @user
    end
    it 'logs in user based off username' do
      expect(user.authenticate('Dave', '12345')).to eq @user
    end
    it 'fails for incorrect email' do
      expect(user.authenticate('dav@dav.com', '12345')).to eq nil
    end
    it 'fails for incorrect username' do
      expect(user.authenticate('Dave Davis', '12345')).to eq nil
    end
  end
end
