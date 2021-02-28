require_relative 'database_helper'
require_relative 'setup_test_database'

describe User do
  describe '.create' do

    it 'creates a user' do
      setup_test_database
      @user = User.create(email: 'email@gmail.com', password: 'password')
      persisted_data = persisted_data(table: :users, id: @user.id)

      expect(@user).to be_a User
      expect(@user.id).to eq persisted_data['id']
      expect(@user.email).to eq 'email@gmail.com'
    end
  end

  describe '.find' do
    setup_test_database
    it'finds user by the id' do
      user = User.create(email: 'email@gmail.com', password: 'password')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
    it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
    end
  end
end
