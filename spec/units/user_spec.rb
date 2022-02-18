# frozen_string_literal: true

require 'user'

RSpec.describe User do
  let(:connection) { connection = PG.connect(dbname: 'chitter_test') }
  let(:email) { 'example@email.com' }
  let(:password) { 'password123' }

  describe '.create' do
    it 'Returns a new user' do
      user = described_class.create(email, password)

      expect(user).to be_a(User)
    end

    it 'encrypts the password' do
      expect(BCrypt::Password).to receive(:create).with(password)

      described_class.create(email, password)
    end

    it 'creates a new user into the database' do
      user = described_class.create(email, password)

      persisted_data = connection.query(
        "Select * from users WHERE id = '#{user.id}';"
      )

      expect(user.id).to eq persisted_data.first['id']
    end

    it 'new user\'s email inserted into the database' do
      user = described_class.create(email, password)

      persisted_data = connection.query(
        "Select * from users WHERE id = '#{user.id}';"
      )

      expect(persisted_data.first['email']).to eq email
    end
  end

  describe '.find' do
    it 'finds a user in the database' do
      user = described_class.create(email, password)

      result = described_class.find(user.id)

      expect(result.id).to eq user.id
    end

    it 'returns a null user if id is nil' do
      result = described_class.find(nil)

      expect(result).to be_a NullUser
    end
  end

  describe '.authenticate' do
    it 'returns the user that matches the given email' do
      described_class.create(email, password)
      result = described_class.authenticate(email, password)

      expect(result.email).to eq email
    end

    it 'returns a null user if email is not in database' do
      result = described_class.authenticate(email, password)

      expect(result).to be_a NullUser
    end

    it 'returns a null user if password is wrong' do
      described_class.create(email, password)
      result = described_class.authenticate(email, 'wrong password')

      expect(result).to be_a NullUser
    end

    it 'decrypts users password' do
      described_class.create(email, password)
      expect(BCrypt::Password).to receive(:new)

      described_class.authenticate(email, password)
    end
  end
end
