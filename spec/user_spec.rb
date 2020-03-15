require './lib/user'
require_relative 'database_helpers'

describe User do
  describe ".create" do
    it "creates a new user" do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Jim', username: 'itsyaboyjim')

      persisted_data = persisted_data(id: user.id)


      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq "test@example.com"

    end

  end

end
