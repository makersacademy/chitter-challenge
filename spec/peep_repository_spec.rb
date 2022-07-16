require 'peep_repository'

def reset_chitter_table
  seed_sql = File.read('spec/seeds/seeds_chitter_database_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
before(:each) do 
    reset_chitter_table
end

  context "when returning all Peep objects" do
    it "returns only Peep objects" do
      repo = PeepRepository.new
      peeps = repo.all
      expect(peeps.length).to eq 6

      expect(peeps[0].id).to eq 1
      expect(peeps[0].content).to eq 'I love sunshine'
      expect(peeps[0].time).to eq '2004-10-19 10:23:54'    
      #for later: to use # Time.new.strftime("posted at%l:%Mp on %d %b") when creating a user
      #but reverting to the record reading when calling a user
      expect(peeps[0].user_id).to eq 1

      expect(peeps[4].id).to eq 5
      expect(peeps[4].content).to eq 'I like dogs'
      expect(peeps[4].time).to eq '2004-10-19 10:15:54'
      expect(peeps[4].user_id).to eq 1
    end
 end

  context "when looking for a peep by ID" do
    it "returns one Peep object" do
      repo = PeepRepository.new
      peep = repo.find(2)

      expect(peep.id).to eq 2
      expect(peep.content).to eq 'I do not love sunshine'
      expect(peep.time).to eq '2004-10-19 12:23:54'
      expect(peep.user_id).to eq 2
    end

    it "returns 'no record found' if peep's ID is not in the database" do
      repo = PeepRepository.new
      expect(repo.find(10)).to eq "No record found"
    end
  end

  it "create a Peep object" do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.content = 'a very new content'
    new_peep.time = '2004-10-19 16:54:54'
    new_peep.user_id = 2
    expect(repo.create(new_peep)).to eq nil
    expect(repo.all.length).to eq 7
    added_peep = repo.all[-1]
    expect(added_peep.id).to eq 7
    expect(added_peep.content).to eq 'a very new content'
    expect(added_peep.time).to eq '2004-10-19 16:54:54'
    expect(added_peep.user_id).to eq 2
  end
end