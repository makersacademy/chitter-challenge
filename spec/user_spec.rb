require 'user'

describe 'User' do
  warbler = User.create(
    username: 'chris',
    email: 'chris@makers.com',
    password: 'classicWoW')

  context '#create' do
    it 'can be created' do
      warbler = User.create(
        username: 'chris',
        email: 'chris@makers.com',
        password: 'classicWoW'
      )
    end
  end

  context '#username' do
    it "displays Warbler's username" do
      warbler = User.create(
        username: 'chris',
        email: 'chris@makers.com',
        password: 'classicWoW'
      )
      expect(warbler.username).to eq('chris')
    end
  end

  context '#authenticate' do
      let!(:user) {User.create(
        username: 'chris',
        email: 'chris@makers.com',
        password: 'classicWoW'
      ) }
    it "Sign in if username and password are correct" do
      expect(User.authenticate('chris', 'classicWoW')).to eq(user)
    end
  end

end
