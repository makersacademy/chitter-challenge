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

  context "create" do 
    let(:user) { User.create(name: "Test", username: "Test974", email: "Test@123", password: "1234") }
    it "stores user name" do
      expect(user.name).to eq "Test"
    end

    it "stores username" do 
      expect(user.username).to eq "Test974"
    end

    it "stores user email" do
      expect(user.email).to eq "Test@123"
    end

    it "stores user password" do
      expect(user.password).to eq "1234"
    end

    it 'validates uniqueness of email property' do 
      user1 = User.create(:email => 'test@gmail.com', :password => 'correct_password')
      user2 = User.create(:email => 'test@gmail.com', :password => 'correct_password')
      expect(user1.valid?).to eq true
      expect(user2.valid?).to eq false
    end 
  end

end
