require "./lib/user"

describe User do 
  
  describe ".create" do
    it "creates a new user" do
      user = User.create(email: "ab@cd.com", username: "Test666", name: "Firstname", password: "123456")

      expect(user.id).not_to be_nil
    end
  end

  describe ".all" do
    it "returns all users" do
      user = User.create(email: "ab@cd.com", username: "Test666", name: "Firstname", password: "123456")

      expect(User.all.map(&:id)).to include user.id
    end
  end

  describe ".find" do
    it "find a user by using an id" do
      user = User.create(email: "ab@cd.com", username: "Test666", name: "Firstname", password: "123456")
      
      expect(User.find(user.id).name).to eq(user.name)
    end

    it "returns nil if no ID is given" do
      expect(User.find(nil)).to eq(nil)
    end
  end

end
