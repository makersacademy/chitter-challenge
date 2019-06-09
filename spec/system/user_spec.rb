require 'user'

describe User do

  before(:each) do 
    User.create(email: 'email_address_1@gmail.com', password: 'password12345', name: 'name_1', username: 'username_1')
    User.create(email: 'email_address_2@gmail.com', password: 'password678910', name: 'name_2', username: 'username_2')
  end
  
  let(:users) { User.all }
  
  describe '#all' do
    it "can store multiple users" do
      expect(users.length).to eq 2
      expect(users.first).to be_a User
      expect(users.last).to be_a User
    end
  end

  describe '#create' do
    it "can create a new user" do
      expect(users.first).to be_a User
      expect(users.first.email).to eq('email_address_1@gmail.com')
      expect(users.first.password).to eq('password12345')
      expect(users.first.name).to eq('name_1')
      expect(users.first.username).to eq('username_1')
    end
  end
end
