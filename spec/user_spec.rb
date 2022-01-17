require 'user'
require 'database_helpers'

describe User do 
  describe '.create' do 
    it 'adds new user with username, handle and password' do 
      user = User.create(username: 'testuser', handle: '@test', password: 'pwtest')
      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.username).to eq 'testuser'
      expect(user.handle).to eq '@test'
      expect(user.id).to eq persisted_data['id']
    end

    it 'hashes the password using BCrypt' do 
      expect(BCrypt::Password).to receive(:create).with('pwtest')
      User.create(username: 'testuser', handle: '@test', password: 'pwtest')
    end
  end

  describe '.find' do 
    it 'retrieves a specific user in db by ID' do 
      user = User.create(username: "testusername", handle: "@test", password: "testpw")
      result = User.find(id: user.id)
      expect(result.id).to eq user.id # checking that the new instance of user matches the db user details i.e. that .find does retrieve the correct user from db
      expect(result.username).to eq user.username
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

end