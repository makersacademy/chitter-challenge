require 'user'

describe User do

  describe '.all' do
    it 'shows all the users in the database' do
      User.create('Han Solo', 'hansolo', 'hansolo@gmail.com', 'pa$$w0rd1')
      User.create('Luke Skywalker', 'lukeskywalker', 'lukeskywalker@gmail.com', 'pa$$w0rd2')
      User.create('Princess Leia', 'princessleia', 'princessleia@gmail.com', 'pa$$w0rd3')
      users = User.all
      names = users.map(&:name)
      expect(names).to include 'Han Solo'
      expect(names).to include 'Luke Skywalker'
    end
  end

  describe '.create' do
    it 'creates a new user in the database' do
      User.create('Chewbacca', 'chewbacca', 'chewbacca@gmail.com', 'pa$$w0rd4')
      users = User.all
      names = users.map(&:name)
      usernames = users.map(&:username)
      expect(names).to include 'Chewbacca'
      expect(usernames).to include 'chewbacca'
    end
  end

end
