require './lib/user.rb'

RSpec.describe User do 

  context "attributes" do 
    it "has email attribute" do 
      user = User.create(email: 'test@test.com')
      expect(user).to have_attributes(:email => 'test@test.com')
    end 

    it "has password attribute" do
      user = User.create(password: '123')
      expect(user).to have_attributes(:password => '123')
    end

    it "has name attribute" do 
      user = User.create(name: 'Michael')
      expect(user).to have_attributes(:name => 'Michael')
    end

    it "has username attribute" do 
      user = User.create(username: 'Michael974')
      expect(user).to have_attributes(:username => 'Michael974')
    end
  end
end
