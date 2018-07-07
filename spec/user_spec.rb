require 'user'

describe User do

  describe '.all' do
    it 'shows all the users in the database' do
      user1 = User.create('Han Solo','hansolo','hansolo@gmail.com','pa$$w0rd1')
      user2 = User.create('Luke Skywalker','lukeskywalker','lukeskywalker@gmail.com','pa$$w0rd2')
      users = [user1, user2]
      expect(Users.all).to eq users

  describe '.create' do
    it 'creates a new user in the database' do
      User.create('Princess Leia','princessleia','princessleia@gmail.com','pa$$w0rd3')
      users = Users.all
      names = users.map(&:name)
      expect(users).to include 'Princess Leia'
    end
  end

end
