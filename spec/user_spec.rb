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
  end

  # describe '.current_user' do
  #   context 'when a new user is created' do
  #     it 'flags that user as the current user' do
  #       user = User.create('Chewbacca', 'chewbacca', 'chewbacca@gmail.com', 'pa$$w0rd4')
  #       expect(User.current_user).to eq user
  #     end
  #     it 'switches from one user to another' do
  #       user1 = User.create('Chewbacca', 'chewbacca', 'chewbacca@gmail.com', 'pa$$w0rd4')
  #       user2 = User.create('Darth Vader', 'darth_vader', 'darthvader@gmail.com', 'pa$$w0rd5')
  #       expect(User.current_user).to eq user2
  #     end
  #   end
  # end

end
