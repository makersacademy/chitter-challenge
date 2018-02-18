require 'user'

describe User do

  describe '.all' do
    it 'returns all users objects' do
      User.create('test@test.com', 'password', 'Testname', 'TestUsername')
      users = User.all
      usernames = users.map(&:username)
      expect(usernames).to include 'TestUsername'
    end
  end

  describe '.create' do
    it 'adds a new user to the database' do
      User.create('test@test.com', 'password', 'Testname', 'TestUsername')
      users = User.all
      usernames = users.map(&:username)
      expect(usernames).to include 'TestUsername'
    end
  end

  describe 'find' do
    it 'returns a User object based on id' do
      user = User.create('test@test.com', 'password', 'Testname', 'TestUsername')
      expect(User.find(user.id).name).to eq user.name
    end

    it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
    end
  end

end
