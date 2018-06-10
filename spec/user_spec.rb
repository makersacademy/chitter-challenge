require 'user'

describe User do
  before(:each) do
    @user = User.save(username: 'John Snow', email: 'j.snow@gmail.com', password: 'seekrit')
  end

  describe '.save' do
    it 'adds a new user to the database' do
      expect(@user.id).not_to be_nil
    end
  end

  describe '.all' do
    it 'returns all users' do
      users = User.all.map(&:username)
      expect(users).to include("John Snow")
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct email and password, if one exists' do
      user = User.save(username: 'person', password: 'password')
      authenticated_user = User.authenticate("person", "password")
      expect(authenticated_user.username).to eq user.username
    end
  end

end
