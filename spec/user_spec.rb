require 'user'

describe '.create' do
  describe 'create a user with name, username, email and password' do
    it 'returns all user details' do

      user = User.create("Harry Potter", "Scarface", 
        "hpotter@gmail.com", "Password123")

      expect(user.name).to eq "Harry Potter"
      expect(user.username).to eq "Scarface"
      expect(user.email).to eq "hpotter@gmail.com"
    end
  end
end
