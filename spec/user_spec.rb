require 'user'

describe User do
  describe '#initialize' do
    it 'takes the result of an SQL query and turns it into a user object' do
      response_data = [{
        id: "1", 
        email: "johnsmith@example.com",
        username: "Johnny S",
        full_name: "John Smith",
        password: "password123"
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
      
    end
  end
end