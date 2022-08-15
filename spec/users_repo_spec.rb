require 'users'
require 'users_repo'
    
  def reset_users_table
    seed_sql = File.read('spec/seeds/chitter_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  describe UserRepository do
    before(:each) do 
    reset_users_table
  end

  context "returns all users" do
    it "returns Joe Bloggs and Brijesh Pujara" do
      repo = UserRepository.new
      users = repo.all
        
      expect(users[0].name).to eq('Joe Bloggs')  
      expect(users[0].email).to eq('joe.bloggs@test.com')  
      expect(users[1].name).to eq('Brijesh Pujara')  
      expect(users[1].email).to eq('brijesh@test.com')  
    end   
  end

  context "returns a user by id" do
    it "returns Brijesh Pujara after entering id " do
      repo = UserRepository.new
      user = repo.find(2)

      expect(user.id).to eq(2)  
      expect(user.name).to eq("Brijesh Pujara")  
      expect(user.email).to eq("brijesh@test.com")  
    end
  end

  context "it creates a new user" do 
    it "creates new user to the database" do 
      repo = UserRepository.new

      new_user = Users.new
      new_user.id = 4
      new_user.name = 'James Bond'
      new_user.email = 'James@test.com'
      new_user.username = '007'
      new_user.password = 'testing123'

      repo.create(new_user)
      users = repo.all

      expect(users.length).to eq(4)  
      expect(users.last.name).to eq('James Bond')  
    end
  end

end
  


  

