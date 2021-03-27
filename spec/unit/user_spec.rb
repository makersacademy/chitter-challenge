require 'user'

describe User do

  describe '.find' do
    it "retrieves a user's details from the database" do
      # id: 1  name: 'Taran' username: 'taran314' email: 'tarandeep-nandhra@hotmail.co.uk' password: 'taranisthebest'
      # later on I want to find the logged in user's credentials, rather than a random ID
      user = User.find("taran314")
      expect(user).to be_kind_of(User)
      expect(user.name).to eq('Taran')
      expect(user.username).to eq('taran314')
      expect(user.email).to eq('tarandeep-nandhra@hotmail.co.uk')
      expect(user.password).to eq('taranisthebest')
    end
    it "returns false if no user found with given username" do
      expect { User.find("nothing") }.to raise_error
    end
  end
  describe '.create_user' do
    it "creates a user object and stores user data to database" do
      new_user = User.create_user("Test", "test_user", "test@hotmail.co.uk", "test123")
      expect(new_user).to be_kind_of(User)
      stored_user = User.find("test_user")
      expect(new_user.email).to eq(stored_user.email)
    end
  end
end