require 'user'

describe User do

  describe '.find' do
    it "retrieves a user's details from the database" do
      # id: 1  name: 'Taran' username: 'taran314' email: 'tarandeep-nandhra@hotmail.co.uk' password: 'taranisthebest'
      # later on I want to find the logged in user's credentials, rather than a random ID
      user = User.find(1)
      expect(user).to be_kind_of(User)
      expect(user.name).to eq('Taran')
      expect(user.username).to eq('taran314')
      expect(user.email).to eq('tarandeep-nandhra@hotmail.co.uk')
      expect(user.password).to eq('taranisthebest')
    end
  end
end