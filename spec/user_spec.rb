require "user"

describe User do
  describe ".all" do
    it "returns all users from the database" do
      # Add test data
      User.create(
        name: "Matt Teapee",
        email: "matt@makers.co",
        password: "password2",
        username: "matt2tea"
      )

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

    it "handles error when duplicate username or email is entered" do
      # Add test data
      User.create(
        name: "Matt Three",
        email: "matt@makers.matt",
        password: "password3",
        username: "matt3tea"
      )
      # Add test data
      User.create(
        name: "Matt Four",
        email: "matt@makers.matt",
        password: "password4",
        username: "matt3tea"
      )

      expect(User.all.length).to eq 1
    end
  end
end
