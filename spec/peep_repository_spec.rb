require "peep_repository"

def reset_peeps_table
  seed_sql = File.read('spec/seeds_peeps.sql')
  connection = DatabaseConnection.connect
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  context "all method" do
    it "returns all peep objects in an array" do
      repo = PeepRepository.new

      peeps = repo.all

      expect(peeps.length).to eq 6

      expect(peeps[0].id).to eq 1
      expect(peeps[0].content).to eq 'Just had the best burger ever!'
      expect(peeps[0].timestamp).to eq '2022-09-01 12:30:00'
      expect(peeps[0].user_id).to eq 1

      expect(peeps[1].id).to eq 2
      expect(peeps[1].content).to eq "Can't wait for the weekend!"
      expect(peeps[1].timestamp).to eq '2022-09-02 16:45:00'
      expect(peeps[1].user_id).to eq 2
    end

    it "returns empty array when database is empty" do
      new_connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
      new_connection.exec('TRUNCATE TABLE peeps RESTART IDENTITY;')

      repo = PeepRepository.new
      peeps = repo.all

      expect(peeps).to eq []
    end
  end

  context "find(id) method" do
    it "gets a single peep" do
      repo = PeepRepository.new

      peep = repo.find(1)

      expect(peep.id).to eq 1
      expect(peep.content).to eq 'Just had the best burger ever!'
      expect(peep.timestamp).to eq '2022-09-01 12:30:00'
      expect(peep.user_id).to eq 1 
    end
  end

  context "find_by_user_id(user_id) method" do
    it "finds all peeps by a user" do
      repo = PeepRepository.new

      user_peeps = repo.find_by_user_id(1)
      
      expect(user_peeps[0].id).to eq 1
      expect(user_peeps[0].content).to eq 'Just had the best burger ever!'
      expect(user_peeps[0].timestamp).to eq '2022-09-01 12:30:00'
      expect(user_peeps[0].user_id).to eq 1

      expect(user_peeps[1].id).to eq 4
      expect(user_peeps[1].content).to eq 'Watching the game with friends tonight'
      expect(user_peeps[1].timestamp).to eq '2022-09-04 20:15:00'
      expect(user_peeps[1].user_id).to eq 1
    end
  end

  context "post(peep) method" do
    it "posts a new peep" do
      repo = PeepRepository.new

      peep = Peep.new
      peep.id = 7
      peep.content = "content"
      peep.timestamp = "2023-11-03 19:35:00"
      peep.user_id = 3

      repo.post(peep)
      new_peep = repo.find(7) 
      expect(new_peep.id).to eq 7
      expect(new_peep.content).to eq "content"
      expect(new_peep.timestamp).to eq "2023-11-03 19:35:00"
      expect(new_peep.user_id).to eq 3
    end
  end

  context "delete(peep) method" do 
    it "deletes a peep" do
      repo = PeepRepository.new

      peep = Peep.new
      peep.id = 7
      peep.content = "content"
      peep.timestamp = "2023-11-03 19:35:00"
      peep.user_id = 3

      repo.post(peep)
      expect(repo.all.length).to eq 7

      repo.delete(peep)
      expect(repo.all.length).to eq 6

    end
  end
end

