require 'User'

describe User do
  describe '#all shows users' do
    it 'expects to see the users name' do
      User.create(username: "my username11", name: "name22", email: "email@email.com33", password: "my password44")
      expect(User.all).to include("my username11")
    end
  end
end

  describe '#create creates a new users' do
    it 'create a new user' do
      user = User.create(username: "my username111", name: "my name222", email: "email@email.com333", password: "my password444")
      expect(user['username']).to eq("my username111")
      expect(user['name']).to eq("my name222")
      expect(user['email']).to eq("email@email.com333")
      expect(user['password']).to eq("my password444")
    end
  end
