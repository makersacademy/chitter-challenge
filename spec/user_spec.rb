# frozen_string_literal: true

require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = described_class.create(
        username: 'TestUser',
        email: 'TestEmail@Test.com',
        password: 'TestPassword'
      )
      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a described_class
      expect(user.id).to eq persisted_data['id']
      expect(user.username).to eq 'TestUser'
      expect(user.email).to eq 'TestEmail@Test.com'
      expect(user.password).to eq 'TestPassword'
    end
  end

  describe '.find_by_id' do
    it 'returns a user by its id' do
      user = described_class.create(
        username: 'TestUser',
        email: 'TestEmail@Test.com',
        password: 'TestPassword'
      )
      user_by_id = described_class.find_by_id(id: user.id)

      expect(user_by_id).to be_a described_class
      expect(user_by_id.id).to eq user.id
      expect(user_by_id.username).to eq 'TestUser'
      expect(user_by_id.email).to eq 'TestEmail@Test.com'
      expect(user_by_id.password).to eq 'TestPassword'
    end
  end

  # describe '#log_in' do
  #   it 'changes user status to logged_in' do
  #
  #   end
  # end
  #
  # describe '#log_out' do
  #   it 'changes user status to logged out' do
  #
  #   end
  # end
end
