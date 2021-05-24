require 'database_helpers'
require 'user'

describe User do 
  let(:user) { User.create(name: "Sally Mole", username: "Molly89", email: "test@example.com", password: "password123") }

  describe '.create' do

  it 'creates a new user' do

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data['id']
    expect(user.email).to eq 'test@example.com'
  end
end 

describe ".find" do

    it "should return a specific user by user id" do
      specific_user = User.find(result.id)

      expect(specific_user).to be_a User
      expect(specific_user.id).to eq user.id
      expect(specific_user.name).to eq user.name
    end

    it "should return nil if user_id is nil" do
      specific_user = User.find(nil)

      expect(specific_user).to be nil
    end
  end

  describe '.authenticate' do
    it 'logs an user in with an username and password' do

      authenticated_user = User.authenticate(username: 'chrisc', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end

    it "returns nil if the username is incorrect or doesn't exist" do

      expect(User.authenticate(username: 'Bolly89', password: 'password123')).to be_nil
    end

    it "returns nil if the password is wrong" do
      expect(User.authenticate(username: 'Molly89', password: 'password111')).to be_nil
    end
  end
end 
 