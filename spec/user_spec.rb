require 'database_helpers'
require 'user'

describe User do
  describe ".create" do
    it "creates a new user" do
      user = User.create(email: "test1234@test.com", password: "1234test")
      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq "test1234@test.com"
    end
  end

  describe ".find" do
    it "finds a user by his/her id" do
      user = User.create(email: "test1234@test.com", password: "1234test")
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end
