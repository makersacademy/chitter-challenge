require 'peep_repository'


def reset_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  
  before(:each) do 
    reset_tables
  end

  describe "#all" do
    it "returns info for all peeps" do
      repo = PeepRepository.new
      peeps = repo.all
    
      expect(peeps.length).to eq (5)
      expect(peeps.first.id).to eq ('1')
      expect(peeps.first.content).to eq ('My first peep!!!')
      expect(peeps.first.date_and_time).to eq ('2022-11-30 12:05:06')
      expect(peeps.first.user_id).to eq ('1')
      expect(peeps.last.id).to eq ('5')
      expect(peeps.last.content).to eq ('Has anyone seen my rubber duck?')
      expect(peeps.last.date_and_time).to eq ('2022-12-01 18:11:55')
      expect(peeps.last.user_id).to eq ('2')
    end
  end

  describe "#peeps_by_user(id_of_user)" do
    it "returns all peeps by given user" do
      repo = PeepRepository.new
      peeps_by_user = repo.peeps_by_user(2)

      expect(peeps_by_user.length).to eq (2)
      expect(peeps_by_user.first.id).to eq ('2')
      expect(peeps_by_user.first.content).to eq ('Second Maker to peep lmao!')
      expect(peeps_by_user.first.date_and_time).to eq ('2022-11-30 16:45:12')
      expect(peeps_by_user.first.user_id).to eq ('2')
      expect(peeps_by_user.last.id).to eq ('5')
      expect(peeps_by_user.last.content).to eq ('Has anyone seen my rubber duck?')
      expect(peeps_by_user.last.date_and_time).to eq ('2022-12-01 18:11:55')
      expect(peeps_by_user.last.user_id).to eq ('2')
    end

    it "raises error when non-existent user_id is given" do
      repo = PeepRepository.new
      expect{ repo.peeps_by_user(70) }.to raise_error ("This user does not exist")
    end
  end

  describe "#create(peep)" do
    it "adds a new peep to the dataset" do
      new_peep = Peep.new
      new_peep.content = 'New test peep'
      new_peep.date_and_time = '2022-12-01 19:43:11'
      new_peep.user_id = 3
      
      repo = PeepRepository.new
      repo.create(new_peep)

      peeps = repo.all

      expect(peeps.length).to eq (6)
      expect(peeps.last.id).to eq ('6')
      expect(peeps.last.content).to eq ('New test peep')
      expect(peeps.last.date_and_time).to eq ('2022-12-01 19:43:11')
      expect(peeps.last.user_id).to eq ('3')
    end

    it "raises error when content is an empty string" do
      new_peep = Peep.new
      new_peep.content = ''
      new_peep.date_and_time = '2022-12-01 19:43:11'
      new_peep.user_id = 3
      
      repo = PeepRepository.new
      expect{ repo.create(new_peep) }.to raise_error("Peeps must be at least 1 character long")
    end
  end
end