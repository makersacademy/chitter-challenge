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

end
