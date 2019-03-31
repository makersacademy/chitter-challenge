require 'user'

describe User do
  describe '.create' do
    it 'should add a user to user table' do
      result = User.create('test_name', 'test_username', 'test_email', 'test_password')
      expect(result.name).to eq 'test_name'
      expect(result.username).to eq 'test_username'
      expect(result.email).to eq 'test_email'
      expect(result.password).to eq 'test_password'
    end
  end

  describe '.sign_in' do
    it 'should retrieve user from users table' do
      User.create('test_name', 'test_username', 'test_email', 'test_password')
      result = User.sign_in('test_username', 'test_password')
      expect(result.name).to eq 'test_name'
      expect(result.username).to eq 'test_username'
      expect(result.email).to eq 'test_email'
      expect(result.password).to eq 'test_password'
      expect(result.id).to eq '1'
    end
  end

  describe '.find' do
    it 'should retrieve a user from users table using id' do
      user = User.create('test_name', 'test_username', 'test_email', 'test_password')
      result = User.find(user.id)
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
      expect(result.password).to eq user.password
      expect(result.id).to eq user.id
    end
  end
end
