require "pg"
require "user"

describe User do
  describe ".all" do
    it "returns all users from the database" do
      connection = PG.connect(dbname: "chitter_test")

      # Add test data
      connection.exec("INSERT INTO users (name, email, password, username) VALUES ('Matt Teapee', 'matt@makers.co', 'password2', 'matt2tea');")

      users = User.all
      expect(users.length).to eq 1
      expect(users.first).to be_a User
      expect(users.first.username).to eq "matt2tea"
    end
  end

  describe ".create" do
    it "creates a new user" do
      # Add test data
      User.create(
        name: "Matt Three",
        email: "matt@makers.co",
        password: "password3",
        username: "matt3tea"
      )
      
      expect(User.all[0].username).to eq "matt3tea"
    end
  end
end