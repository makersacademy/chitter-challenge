require 'user'

describe User do
  describe '.all' do
    it 'describes the user' do
      test = User.create(email: "right@email.com", password: "Any123", name: "Bill Test", username: "Billtest")
      User.create(email: "left@email.com", password: "Any345", name: "John Test", username: "Johntest")
      User.create(email: "up@email.com", password: "Any678", name: "Jim Test", username: "Jimtest")

      users = User.all

      expect(users.length).to eq 3
      expect(users.first).to be_a User
      expect(users.first.id).to eq test.id
      expect(users.first.name).to eq "Bill Test"
    end 
  end

  describe '.create' do
    it 'creates a new User' do
      user = User.create(email: "down@email.com", password: "Any123", name: "Bill Test", username: "Billtest")

      expect(user).to be_a User
      expect(user.name).to eq 'Bill Test'
    end

    it 'does not create a new user if the email address is not valid' do
      user = User.create(email: "wrong", password: "Any123", name: "Bill Test", username: "Billtest")
      expect(user).not_to be_a User
    end
  end
end
