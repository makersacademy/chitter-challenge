require 'peeps'
require 'peeps_repo'
    
  def reset_peeps_table
    seed_sql = File.read('spec/seeds/chitter_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  describe PeepRepository do
    before(:each) do 
    reset_peeps_table
  end

  context "returns all peeps" do
    it "returns user id 1 and 2 peeps" do
      repo = PeepRepository.new
      peeps = repo.all
        
      expect(peeps[0].content).to include('Gabriel Jesus')  
      expect(peeps[0].date).to include('2022-05-13')  
      expect(peeps[1].content).to include('Hi all')  
      expect(peeps[1].date).to include('2022-07-13')  
    end   
  end

  context "returns a peep by id" do
    it "returns Brijesh Pujara's peep after entering id " do
      repo = PeepRepository.new
      peeps = repo.find(1)
        
      expect(peeps.content).to include('Gabriel Jesus')  
      expect(peeps.date).to include('2022-05-13')  
    end
  end

  # context "it creates a new user" do 
  #   it "creates new user to the database" do 
  #     repo = UserRepository.new

  #     new_user = Users.new
  #     new_user.id = 4
  #     new_user.name = 'James Bond'
  #     new_user.email = 'James@test.com'
  #     new_user.username = '007'
  #     new_user.password = 'testing123'

  #     repo.create(new_user)
  #     users = repo.all

  #     expect(users.length).to eq(4)  
  #     expect(users.last.name).to eq('James Bond')  
  #   end
  # end

  # context "deletes a user by id" do
  #   xit "removes James Bond from users" do 
  #     repo = UserRepository.new

  #     repo.delete(1)
  #     users = repo.all

  #     expect(users.length).to eq(2)
  #   end
  # end

end
  