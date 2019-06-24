require 'user'


describe User do
  describe ".create" do
    it 'creates a user' do
      user= User.create(username:'Adam1', password: "adam123")

      expect(user.username).to eq("Adam1")
      expect(user.password).to eq("adam123")
    end
  end
end
