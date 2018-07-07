require 'user'

describe User do

  describe '.all' do
    it 'shows all the users in the database' do
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
    it 'returns false if the database already includes the given username' do
      expect(User.create('Han Solo', 'hansolo', 'han_solo@gmail.com', 'pa$$w0rd1')).to be false
    end
    it 'returns false if the database already includes the given email' do
      expect(User.create('Han Solo', 'han_solo', 'hansolo@gmail.com', 'pa$$w0rd1')).to be false
    end
    it 'returns false if an email is not valid' do
      expect(User.create('Darth Vader', 'darth_vader', 'some email', 'pa$$w0rd1')).to be false
    end
  end

end
