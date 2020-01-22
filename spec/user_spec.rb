require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'example@example.com',password: 'example123',name: 'Example Surname', username: 'exampleusername')

      expect(user.email).to eq "example@example.com"
      expect(user.name).to eq "Example Surname"
      expect(user.username).to eq "exampleusername"
    end

    it 'hides the password using bcrypt' do
      expect(BCrypt::Password).to receive(:create).with('example123')
      User.create(email: 'example@example.com',password: 'example123',name: 'Example Surname', username: 'exampleusername')
  end
end

  describe '.find' do
    it 'finds a user' do
      user = User.create(email: 'example@example.com',password: 'example123',name: 'Example Surname', username: 'exampleusername')
      found_user = User.find(id: user.id )

      expect(found_user.id).to eq user.id
      expect(found_user.name).to eq user.name
    end
  end

  describe '.authenticate' do
    it 'authenticates user' do
      user = User.create(email: 'example@example.com',password: 'example123',name: 'Example Surname', username: 'exampleusername')
      authenticated_user = User.authenticate(email: 'example@example.com', password: 'example123')

      expect(authenticated_user.id). to eq user.id
    end
  end
end
