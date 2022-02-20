require_relative '../lib/user'

describe User do
  describe ".new" do
    it 'Creates a new user' do
      user = User.create(name: "Tester", email: "test@gmail.com", password: "PASSWORD")
      expect(user).to be_a User
      expect(user.name).to eq "Tester"
      expect(user.email).to eq "test@gmail.com"
      expect(user.password).to eq "PASSWORD"
    end

  end

end
