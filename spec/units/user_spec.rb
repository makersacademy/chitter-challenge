# frozen_string_literal: true

require 'user'

RSpec.describe User do
  let(:connection) { connection = PG.connect(dbname: 'chitter_test') }

  describe '.create' do
    it 'Returns a new user' do
      user = described_class.create('example@email.com', 'password123')

      expect(user).to be_a(User)
    end

    it 'creates a new user into the database' do
      user = described_class.create('example@email.com', 'password123')

      persisted_data = connection.query(
        "Select * from users WHERE id = '#{user.id}';"
      )

      expect(user.id).to eq persisted_data.first['id']
    end

    it 'new user\'s email inserted into the database' do
      user = described_class.create('example@email.com', 'password123')

      persisted_data = connection.query(
        "Select * from users WHERE id = '#{user.id}';"
      )

      expect(persisted_data.first['email']).to eq 'example@email.com'
    end
  end

  describe '.find' do
    it 'finds a user in the database' do
      user = described_class.create('example@email.com', 'password123')

      result = described_class.find(user.id)

      expect(result.id).to eq user.id
    end

    it 'returns a null user if id is nil' do
      result = described_class.find(nil)

      expect(result).to be_a NullUser
    end
  end
end
