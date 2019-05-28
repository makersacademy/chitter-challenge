require 'user'

describe User do
  describe '.create' do
    it "creates a new user" do
      user = User.create(name: 'Sam', username: 'samk94', email: 'samk@gmail.com', password: 'pass')
      expect(user.name).to eq('Sam')
      expect(user.username).to eq('samk94')
      expect(user.email).to eq('samk@gmail.com')
      expect(user.password).to eq('pass')
    end
  end
end
