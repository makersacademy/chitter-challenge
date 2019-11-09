require 'pg'
require 'user'

describe User do
  context "new user" do
    it 'creates a new user' do
      user = User.create("Ellie", "test@email.com", "ellieSMASH", "Password123")
      expect(user).to be_a(User)
    end

    it 'adds a new user to the user table in the database' do
      User.create("Ellie", "test@email.com", "ellieSMASH", "Password123")
      users = User.all
      expect(users.length).to eq(1)
    end
  end
end
