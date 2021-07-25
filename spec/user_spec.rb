require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        name: 'Example Name',
        username: 'exampleusername',
        email: 'example@example.com',
        password: 'examplepassword'
      )
      persisted_data = persisted_data(id: user.id, table: 'users')

      expect(user).to be_a(User)
      expect(user.id).to eq(persisted_data['id'])
      expect(user.name).to eq('Example Name')
      expect(user.username).to eq('exampleusername')
      expect(user.email).to eq('example@example.com')
      expect(user.password).to eq('examplepassword')
    end
  end

  describe '.find' do
    it 'finds a user from their id' do
      user = User.create(
        name: 'Example Name',
        username: 'exampleusername',
        email: 'example@example.com',
        password: 'examplepassword'
      )
      result = User.find(user.id)

      expect(result).to be_a(User)
      expect(user.name).to eq('Example Name')
      expect(user.username).to eq('exampleusername')
      expect(user.email).to eq('example@example.com')
      expect(user.password).to eq('examplepassword')
    end
  end

  describe '.username_exists?' do
    context 'when username does not exist' do
      it 'returns false' do
        result = User.username_exists?('Example')

        expect(result).to eq(false)
      end
    end

    context 'when username does exist' do
      it 'returns true' do
        user = User.create(
          name: 'Example Name',
          username: 'exampleusername',
          email: 'example@example.com',
          password: 'examplepassword'
        )
        result = User.username_exists?(user.username)

        expect(result).to eq(true)
      end
    end
  end

  describe '.email_exists?' do
    context 'when email does not exist' do
      it 'returns false' do
        result = User.email_exists?('example@example.com')

        expect(result).to eq(false)
      end
    end

    context 'when email does exist' do
      it 'returns true' do
        user = User.create(
          name: 'Example Name',
          username: 'exampleusername',
          email: 'example@example.com',
          password: 'examplepassword'
        )
        result = User.email_exists?(user.email)

        expect(result).to eq(true)
      end
    end
  end
end
