require 'user'

describe User do

  users = described_class.all

  describe ".all" do
    it "Returns an array of objects that are instances of User" do
      expect(users[-1]).to be_an_instance_of described_class
    end

    it "Returns a user's id" do
      expect(users[0].id).to be > 0
    end

    it "Returns a user's email" do
      expect(users[0].email).to eq("Serena@example.com")
    end

    it "Returns a user's name" do
      expect(users[0].name).to eq("Serena")
    end

    it "Returns a user's username" do
      expect(users[0].username).to eq("SerenaH")
    end

    it "Returns a user's password" do
      expect(users[0].password).to eq("Serena@1234")
    end

  end

  describe ".create" do
    it 'Creates a new user' do
      described_class.create("Name", "Username", "Email@example.com", "Password")
      expect(described_class.all[-1].name).to eq("Name")
    end

  end

  # describe ".find" do
  #   it "find a user by ID" do
  #     user = described_class.create("Name", "Username", "Email@example.com", "Password")
  #     expect(described_class.find(id)).to eq user.id
  #   end
  # end

end
