require 'user'

describe User do
  describe '.all' do
    it 'returns all users' do
      res = User.all
      user = res.map(&:name)
      expect(user).to include 'Name'
    end
  end
  describe '.setup' do
    it 'creates Chitter account' do
      User.setup(name: 'Name')
      res = User.all
      user = res.map(&:name)
      expect(user).to include 'Name'
    end
  end
end
