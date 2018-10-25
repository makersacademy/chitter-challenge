describe User do

  describe '.check_password' do
    it '' do
      # TODO
    end
  end

  describe '.check_if_unique' do
    it '' do
      # TODO
    end
  end

  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Firstname Lastname', username: 'username', email: 'email@email.com', password: 'password')
      expect(user).to be_a User
    end
  end

  describe '.all' do
    it 'returns a list of users' do
      User.create(name: 'Firstname Lastname', username: 'username', email: 'email@email.com', password: 'password')

      users = User.all

      expect(users.first).to be_a User
      expect(users.first.name).to eq 'Firstname Lastname'
    end
  end

  subject(:user) { User.create(name: "Firstname Lastname", username: "username", email: "email@email.com", password: "password") }

  describe "#name" do
    it "returns full name of user" do
      expect(user.name).to eq "Firstname Lastname"
    end
  end

  describe "#username" do
    it "returns username of user" do
      expect(user.username).to eq "username"
    end
  end

  describe "#email" do
    it "returns email of user" do
      expect(user.email).to eq "email@email.com"
    end
  end

  describe "#password" do
    it "returns password of user" do
      expect(test_password("password", user.password)).to be true
    end
  end

end
