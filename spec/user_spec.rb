require_relative '../lib/user.rb'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create('magnus', 'Magnus the Red',
                         'sorcerer@great-crusade.org', 'prosperoburns')
      expect(user.username).to eq('magnus')
    end
    it 'creates a hashed password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('prosperoburns')
      User.create('magnus', 'Magnus the Red', 'sorcerer@great-crusade.org', 'prosperoburns')
    end
  end
  describe '.all' do
    it 'returns an array of user instances' do
      user = User.create('magnus', 'Magnus the Red', 'sorcerer@great-crusade.org', 'prosperoburns')
      expect(User.all).to include user
    end
  end
  describe '.retrieve' do
    it 'returns a user instance from their id' do
      user1 = User.create('magnus', 'Magnus the Red', 'sorcerer@great-crusade.org', 'prosperoburns')
      user2 = User.retrieve(user1.id)
      expect(user1).to eq user2
    end
  end
  describe '.authenticate' do
    it 'returns a user instance if the username and password exist' do
      user = User.create('magnus', 'Magnus the Red', 'sorcerer@great-crusade.org', 'prosperoburns')
      authenticated = User.authenticate('sorcerer@great-crusade.org', 'prosperoburns')
      expect(user.id).to eq authenticated.id
    end
  end
end
