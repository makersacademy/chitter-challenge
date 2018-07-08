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
    it 'uses bcrypt to hash a password' do
      expect(BCrypt::Password).to receive(:create).with('pa$$w0rd4')
      User.create('Chewbacca', 'chewbacca', 'chewbacca@gmail.com', 'pa$$w0rd4')
    end
  end

  describe '.find' do
    it 'returns a user given an email address' do
      chewie = User.create('Chewbacca', 'chewbacca', 'chewbacca@gmail.com', 'pa$$w0rd4')
      found_user = User.find('chewbacca@gmail.com')
      expect(found_user.id).to eq chewie.id
    end
  end

  describe '.authenticate' do
    it 'checks that a username has submitted the right email and password' do
      chewie = User.create('Chewbacca', 'chewbacca', 'chewbacca@gmail.com', 'pa$$w0rd4')
      authenticated_chewie = User.authenticate('chewbacca@gmail.com', 'pa$$w0rd4')
      expect(authenticated_chewie.id).to eq chewie.id
    end
    it 'returns nil if the user gives the wrong email' do
      chewie = User.create('Chewbacca', 'chewbacca', 'chewbacca@gmail.com', 'pa$$w0rd4')
      expect(User.authenticate('wrong email', 'pa$$w0rd4')).to be_nil
    end
    it 'returns nil if the user gives the wrong email' do
      chewie = User.create('Chewbacca', 'chewbacca', 'chewbacca@gmail.com', 'pa$$w0rd4')
      expect(User.authenticate('chewbacca@gmail.com', 'wrong password')).to be_nil
    end
  end

  describe '.invalid_username?' do
    it 'returns true if the database already includes the given username' do
      chewie = User.create('Chewbacca', 'chewbacca', 'chewbacca@gmail.com', 'pa$$w0rd4')
      expect(User.invalid_username?(chewie.username)).to be true
    end
  end

  describe '.invalid_email?' do
    it 'returns true if the database already includes the given email' do
      chewie = User.create('Chewbacca', 'chewbacca', 'chewbacca@gmail.com', 'pa$$w0rd4')
      expect(User.invalid_email?(chewie.email)).to be true
    end
  end

end
