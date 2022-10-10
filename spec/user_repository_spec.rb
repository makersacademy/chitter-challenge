require './lib/user.rb'
require './lib/user_repository.rb'

def reset_peeps_table
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

def reset_users_table
    seed_sql = File.read('spec/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  
  describe UserRepository do
    before(:each) do 
      reset_peeps_table
      reset_users_table
      
      
    end

    it "lists all users" do
      repo = UserRepository.new
      user = repo.all

      expect(user.length).to eq(5)

      expect(user[0].id).to eq("1") # =>  1
      expect(user[0].name).to eq("Hibaq") # =>  'Hibaq'
      expect(user[0].username).to eq("Hibaq123") # =>  'Hibaq123'
      expect(user[0].email).to eq("hibaq@gmail.com")
    end

    it "finds a user based on their email address" do
      repo = UserRepository.new
      user = repo.find_by_email('Anna@gmail.com')
     
      expect(user.id).to eq "2"
      expect(user.username).to eq 'Anna123'
      expect(user.email).to eq 'Anna@gmail.com'
    end

    it "finds a user by their id" do
        repo = UserRepository.new
        user = repo.find(1)
     
        expect(user.id).to eq("1") 
        expect(user.name).to eq("Hibaq")
        expect(user.username).to eq("Hibaq123")
        expect(user.email).to eq("hibaq@gmail.com")
        expect(user.password).to eq('potatolife')
    end

    it "creates a user and finds it by searching their email" do
        repo = UserRepository.new

        user = User.new
        user.name = 'Theresa'
        user.username = "Theresa123"
        user.email = "Theresa@gmail.com"
        user.password = "hello123"
        repo.create(user)

        user = repo.find_by_email("Theresa@gmail.com")

       
        expect(user.username).to eq("Theresa123")
        expect(user.email).to eq("Theresa@gmail.com")
        expect(user.password).to eq("hello123")
    end

    context "signing into account" do 
      it "signs in user successfully" do
        repo = UserRepository.new
        user = User.new
        user.name = "Habon"
        user.username = "Habon123"
        user.password = "hello"
        user.email = "habon@gmail.com"
        repo.create(user)

        account = repo.sign_in("habon@gmail.com","hello")
      end

    end





  end