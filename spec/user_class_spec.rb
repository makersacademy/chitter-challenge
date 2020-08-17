require 'user'

describe User do
  describe ".create" do
    it 'creates a new user and returns user instance' do
      user = User.create('test2', 'test2@email.com', 'test2password', 'test two')

      expect(user.full_name).to eq 'Test Two'
      expect(user.username).to eq 'test2'
      expect(user.email).to eq 'test2@email.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('test2password')
  
      User.create('test2', 'test2@email.com', 'test2password', 'test two')
    end
  end

  describe ".all" do
    it 'returns a list of users' do
      User.create('test2', 'test2@email.com', 'test2password', 'test two')

      expect(described_class.all.first.email).to eq 'test1@email.com'
      expect(described_class.all.last.email).to eq 'test2@email.com'
    end
  end

  describe ".find" do
    it 'returns the user corresponding to a given user id' do
      user = User.create('test2', 'test2@email.com', 'test2password', 'test two')

      expect(described_class.find(user.id).username).to eq user.username
    end
  end

  describe ".exists?" do
    it 'returns true if the given parameter and value exist within the user database' do
      expect(described_class.exists?('username', 'test1')).to be_truthy
      expect(described_class.exists?('username', 'invalid_username')).to be_falsey
    end
  end

  describe '.authenticate' do
    it 'returns a user when given an existing username and password combination' do
      user = User.create('test3', 'test3@email.com', 'test3password', 'test three')
      authenticated_user = User.authenticate('test3', 'test3password')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns false when given an incorrect username' do
      expect(described_class.authenticate('incrorrect_username', 'test1password')).to be_falsey
    end

    it 'returns false when given an incorrect password' do
      expect(described_class.authenticate('test1', 'incrorrect_password')).to be_falsey
    end
  end
end
