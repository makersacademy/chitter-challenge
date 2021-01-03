describe User do
  let(:id) { 1 }
  let(:name) { "User 1" }
  let(:user) { User.new(id: id, name: name) }

  let(:table) { "users" }

  describe "#new" do
    it "should initialize an instance of a User object" do
      expect(user).to be_a User
      expect(user.name).to eq name
    end
  end

  describe ".create" do
    it "should insert a user into users table and return an instance of a User" do
      result = User.create(name)
      persisted_data = persisted_data_retrieve(table: table, id: result.id)

      expect(result).to be_a User
      expect(result.id).to eq persisted_data["id"].to_i
      expect(result.name).to eq name
    end
  end

  describe ".instance" do
    it "should return instance of a user" do
      User.create(name)
      result = User.instance
      expect(result).to be_instance_of User
    end
  end

  describe ".find" do
    it "should return a specific user, by id, from the users table in an instance of a User" do
      result = User.create(name)
      user = User.find(result.id)

      expect(user).to be_a User
      expect(user.id).to eq result.id
      expect(user.name).to eq name
    end
  end
end
