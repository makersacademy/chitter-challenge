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


end
  