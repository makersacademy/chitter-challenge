require 'user_class'

describe User do
  describe '#create' do
    it 'creates a new user' do
      PG.connect dbname: "chitter_test"
      user = User.create(email: "samm@makersacademy.com", password: "password123")
      expect(user.email).to eq "samm@makersacademy.com"
      expect(user.password).to eq "password123"
    end
  end
end
