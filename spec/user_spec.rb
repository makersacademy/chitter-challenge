require 'user'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: "Paul", email: "Paul@email.com", username: "Phump", password: "1234")
      expect(user).to be_a User
      expect(user.name).to eq "Paul"
      expect(user.username).to eq "Phump"
      expect(user.email).to eq "Paul@email.com"
      expect(user.password).to eq "1234"
    end
  end
end
