require 'user'

describe User do
  describe '.create' do
    it 'adds a user' do
      user = User.create(username: "Marcus", password: "passw0rd")
      expect(user.username).to eq("Marcus")
      expect(user.password).to eq("passw0rd")
    end
  end
end
