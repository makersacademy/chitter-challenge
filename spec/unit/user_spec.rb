require 'user'

describe User do
  context '#initialize' do
    it 'has a username'do
      user = User.new(id: 1, username: "username", password: "password")
      expect(user.username).to eq "username"
    end

    it 'has a password'do
      user = User.new(id: 1, username: "username", password: "password")
      expect(user.password).to eq "password"
    end
  end
end