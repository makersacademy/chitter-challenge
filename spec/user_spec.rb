require "user"

describe User do

  describe ".create" do

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
  
    it "creates a new user" do
      # Add test data
      User.create(
        name: "Claire Nelson",
        email: "claire@makersacademy.com",
        password: "password2",
        username: "cnelson"
      )
      expect(User.all[0].username).to eq "cnelson"
    end

    it "Chitter handles error when duplicate username or email is entered" do
      # Add test data
      User.create(
        name: "Claire Nelson",
        email: "claire@makersacademy.com",
        password: "password2",
        username: "cnelson"
      )
      # Add test data
      User.create(
        name: "Catherine Nelson",
        email: "catherine@makersacademy.com",
        password: "password3",
        username: "cnelson"
      )
      expect(User.all.length).to eq 1
    end

  end

  describe ".all" do

    it "will return all users from the database " do
      # Add test data
      User.create(
        name: "Claire Nelson",
        username: "cnelson",
        email: "claire@makersacademy.com",
        password: "password1"
      )
      # Add test data
      User.create(
        name: "Dan Nelson",
        username: "dnelson",
        email: "dan@makersacademy.com",
        password: "password1"
      )
      users = User.all
      expect(users.length).to eq 2
      expect(users.first).to be_a User
      expect(users.first.name).to eq "Claire Nelson"
      expect(users.first.username).to eq "cnelson"
      expect(users.first.email).to eq "claire@makersacademy.com"
    end

  end

end
