require 'user'

describe User do
  describe '.create' do
    it "creates a new account" do
      user = User.create(
        email: "name@example.com",
        name: "Willoughby Hood",
        username: "wh3g",
        password: "password123"
      )
      expect(user.first['email']).to eq "name@example.com"
      expect(user.first['name']).to eq "Willoughby Hood"
      expect(user.first['username']).to eq "wh3g"
      expect(user.first['password']).to eq "password123"
    end
  end

  describe '.find' do
    it "finds a user by the id" do
      user = User.create(
        email: "name@example.com",
        name: "Willoughby Hood",
        username: "wh3g",
        password: "password123"
      )

      result = User.find(id: user.first['id'])
      expect(result.name).to eq(user.first['name'])
    end

    it "return nil if no id given" do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
