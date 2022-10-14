require 'user_repository'
require 'user.rb'
require 'dotenv/load'




def reset_users_table
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', user: ENV['MY_USER'], password: ENV['PASSWORD'] })
  connection.exec(seed_sql)
end

RSpec.describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  context "All method" do 
    it "Returns all information about the users" do 
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq(5) 

      expect(users[0].id).to eq(1) 
      expect(users[0].name).to eq("Jack")
      expect(users[0].username).to eq("Jack_user")
      expect(users[0].email_address).to eq("Jacks_email") 
      expect(users[0].password).to eq("Jack_password")
      expect(users[1].id).to eq(2)
      expect(users[1].password).to eq("Rosa_password")
    end 
  end 


  context "Find method" do 
    it "Returns information about the user corresponding to id 3" do 
      repo = UserRepository.new

      user = repo.find(3)

      expect(user.id).to eq(3) 
      expect(user.name).to eq('Timothy') 
      expect(user.username).to eq('Timothy_user')
      expect(user.email_address).to eq('Timothy_email')

    end 
  end 

  context "Create method" do 
    it "Creates a new user" do 
      repo = UserRepository.new

      new_user = User.new
      new_user.name = "new_name_1" 
      new_user.username = "new_username_1"
      new_user.email_address = "new_email_address_1"
      new_user.password = "new_password_1" 
      repo.create(new_user)

      users = repo.all 

      expect(users.length).to eq(6)
      expect(users.last.name).to eq("new_name_1")
      expect(users.last.username).to eq("new_username_1")
      expect(users.last.email_address).to eq("new_email_address_1")
      expect(users.last.password).to eq("new_password_1")

    end 
  end 
end 



