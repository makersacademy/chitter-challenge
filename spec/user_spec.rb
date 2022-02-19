require './lib/user'
require 'database_helpers'

describe User do
  describe '.create' do
    it "adds a user to the database" do
      user = User.create(id: '1', first_name: "Eddie", last_name: "Arnold", email: "123@me.com", user_password: "12345")
      persisted_data = user_persisted_data(id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.first_name).to eq 'Eddie'
    end
  end

  describe '.find' do
    it "finds the user it searches" do
      user = User.create(id: '1', first_name: "Eddie", last_name: "Arnold", email: "123@me.com", user_password: "12345")
      retrieved_user = User.find(id: user.id)
      expect(retrieved_user.id).to eq user.id
    end
  end

  describe '.find_by' do
    it "finds the user by email and password" do
      user = User.create(id: '1', first_name: "Eddie", last_name: "Arnold", email: "123@me.com", user_password: "12345")
      retrieved_user = User.find_by(email: user.email, user_password: user.user_password)
      expect(retrieved_user.id).to eq user.id
    end
  end
end
