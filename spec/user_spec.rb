require 'user.rb'

describe User do
  let(:user) { described_class.create(email: 'test@example.com',
    password: 'password123',
    name: 'testdude',
    handle: 'testhandle') }
  let(:user_params) { { email: 'test@example.com',
    password: 'password123',
    name: 'testdude',
    handle: 'testhandle' } }

  describe '.all' do
    it 'returns an array of all users' do
      expect(described_class.all).to be_an Array
    end
  end

  describe '.create' do
    it 'creates a new user' do
      expect(user.id).not_to be_nil
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(user_params)
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      expect(User.find(user.id).email).to eq user.email
    end

    it 'returns nil when there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end
