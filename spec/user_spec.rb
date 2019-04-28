require 'user'

describe User do

  describe '.create' do
    it 'create new user record' do
      user = User.create(name: "Simon", username: "SY",
        email: "example@example.com", password: "password123")

      expect(user.name).to eq "Simon"
      expect(user.username).to eq "SY"
      expect(user.email).to eq "example@example.com"
      expect(user.password).to eq "password123"
    end
  end

  describe '.find' do
    it 'find the user by email' do
      User.create(name: "Simon", username: "SY",
        email: "example@example.com", password: "password123")

      User.create(name: "Sam", username: "Makers",
          email: "example2@example.com", password: "password1234")

      user = User.find(email: "example@example.com", password: "password123")

      expect(user.name).to eq "Simon"
      expect(user.username).to eq "SY"
      expect(user.email).to eq "example@example.com"
      expect(user.password).to eq "password123"
    end
  end

end
