
require './lib/user'

describe User do
  describe '.create' do
    it "creates a new user in the database" do
      
      user = User.create(grip: "&abacon", name: "Andrew Bacon", email: "abacon@email.com", password: "password1")
      data_query = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{user.id}';")

      expect(user).to be_a User

      expect(user.id).to eq data_query.first['id']
      expect(user.grip).to eq '&abacon'
      expect(user.email).to eq 'abacon@email.com'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(grip: "&abacon", name: "Andrew Bacon", email: "abacon@email.com", password: "password1")
      p user
      result = User.find(id: user.id)
    
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end
end