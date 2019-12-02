require 'user'

describe User do
  describe '#initialize' do
    it 'stores name, username, email, and password' do
      user = User.new(name: "Charlie", username: "charlie123", email: "charlie@emailhost.com", password: "password321")
      expect(user.name).to eq("Charlie")
      expect(user.username).to eq("charlie123")
      expect(user.email).to eq("charlie@emailhost.com")
      expect(user.password).to eq("password321")
    end
  end
end
