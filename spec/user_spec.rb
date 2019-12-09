require "user"

describe User do 
  describe ".all" do 
    it "contains all the users infomation after it's passed" do
      User.create(email: 'maker@gmail.com', password: 'coding101', username: 'curiouscoder', name: 'bobby')

      user = User.all

      expect(user[0]).to include("maker@gmail.com")
      expect(user[0]).to include("coding101")
      expect(user[0]).to include('curiouscoder')
      expect(user[0]).to include('bobby')
    end
  end

  describe ".create" do
    it "should contain the username" do
      User.create(email: 'yeehaw@gmail.com', password: 'roadeo', username: 'enthusiastcowboy', name: 'jeff')
      expect(User.all[0]).to include("enthusiastcowboy")
    end
  end
end
