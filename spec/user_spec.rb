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

    it "stores an encrypted password" do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@123.com', password: 'password123')
    end
  end

  describe ".find" do
    it "finds a user by his/her id" do
      user = User.create(email: "test1234@test.com", password: "1234test")
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe ".authenticate" do
    it "authenticates user as existant" do
      user = User.create(email: "test1234@test.com", password: "1234test")
      authenticated_user = User.authenticate(email: "test1234@test.com", password: "1234test")

      expect(authenticated_user.id).to eq user.id
    end

    it "returns nil when user is non-existant" do
      user = User.create(email: 'test@example.com', password: 'password123')

      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(email: 'test@example.com', password: 'password123')

      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end
  end
end
