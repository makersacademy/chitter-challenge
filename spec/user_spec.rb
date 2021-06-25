require 'user'

describe User do

  describe '::create' do
    it 'creates a new instance of user' do
      new_user = User.create(name: "Mike", username: "MikeMikeMike", email: "Mike@hotmail.com", password: "password123")
      expect(new_user).to be_a User
      expect(new_user.name).to eq("Mike")
      expect(new_user.username).to eq("MikeMikeMike")
    end
  end
end