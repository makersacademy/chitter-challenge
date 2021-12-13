require 'user'
require 'database_helpers'

describe User do
  describe '#initialize' do
    it 'takes the result of an SQL query and turns it into a user object' do
      response_data = [{
        'id' => "1",
        'email' => "johnsmith@example.com",
        'username' => "Johnny S",
        'full_name' => "John Smith",
        'password' => "password123"
      }]

      user = described_class.new(response_data)
      expect(user).to be_instance_of(described_class)
      expect(user.id).to eq 1
      expect(user.email).to eq "johnsmith@example.com"
      expect(user.username).to eq "Johnny S"
      expect(user.full_name).to eq "John Smith"
      expect(user.password).to eq "password123"
      
    end
  end

  describe '.add_user' do
    it 'adds user credentials to the database' do
      user = User.add_user(
        email: 'johnsmith@example.com',
        username: 'Johnny S',
        full_name: 'John Smith',
        password: 'password123'
      )

      persisted_data = persisted_data(table: 'users', id: user.id)
      expect(user).to be_instance_of(User)
      expect(persisted_data["email"]).to eq 'johnsmith@example.com' 
      expect(persisted_data["username"]).to eq 'Johnny S' 
      expect(persisted_data["full_name"]).to eq 'John Smith' 
      expect(persisted_data["password"]).to eq 'password123' 
    end
  end

  describe '.find_user' do
    it 'finds and returns a user from the DB with the specified credential' do
      user = User.add_user(
        email: 'johnsmith@example.com',
        username: 'Johnny S',
        full_name: 'John Smith',
        password: 'password123'
      )

      expect(described_class.find_user('email','johnsmith@example.com')).to be_instance_of User
      expect(described_class.find_user('username','Johnny S')).to be_instance_of User
    end
  end
end