describe User do
  let(:id) { 1 }
  let(:email) { "test@example.com" }
  let(:password) { "password123" }
  let(:name) { "User 1" }
  let(:user_name) { "Usr1" }

  let(:table) { "users" }

  describe ".create" do
    it "should insert a user into users table and return an instance of a User" do
      result = User.create(email: email, password: password, name: name, user_name: user_name)
      persisted_data = persisted_data_retrieve(table: table, id: result.id)

      expect(result).to be_a User
      expect(result.id).to eq persisted_data["id"]
      expect(result.email).to eq email
      expect(result.name).to eq name
      expect(result.user_name).to eq user_name
    end

    it "hashes the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with("password123")

      User.create(email: email, password: password, name: name, user_name: user_name)
    end
  end

  describe ".find" do
    it "should return a specific user, by id, from the users table in an instance of a User" do
      result = User.create(email: email, password: password, name: name, user_name: user_name)
      user = User.find(result.id)

      expect(user).to be_a User
      expect(user.id).to eq result.id
      expect(user.name).to eq name
    end

    it "should return nil if user_id is nil" do
      user = User.find(nil)

      expect(user).to be nil
    end
  end

  describe ".authenticate" do
    it "should return a user if the user details match an existing user" do
      result = User.create(email: email, password: password, name: name, user_name: user_name)
      user = User.authenticate(email: email, password: password)

      expect(user).to be_a User
      expect(user.id).to eq result.id
      expect(user.name).to eq name
    end
  end
end
