require 'peeps_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/chitter_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe PeepsRepository do
  before(:each) do
    reset_peeps_table
  end

  it 'shows all the peeps content' do
    repo = PeepsRepository.new
    expect(repo.all.length).to eq 3
    expect(repo.all[0].peep_content).to eq 'Welcome to chitter'
    expect(repo.all[2].time_of_peep).to eq '2023-03-22 17:00:00'
    expect(repo.all[1].user_id).to eq 6

  end

  it 'finds a peep by id' do
  repo = PeepsRepository.new
  peep = repo.find(1)
  expect(peep.peep_content).to eq 'Welcome to chitter'
  expect(peep.user_id).to eq 5
  peep = repo.find(2)
  expect(peep.time_of_peep.strftime("%Y-%m-%d %H:%M:%S")).to eq '2023-03-15 12:00:00'
  end


  it "creates a new peep" do
    repo = PeepsRepository.new
      peep = Peeps.new
      peep.peep_content = "I am a new test peep"
      peep.time_of_peep = '2023-04-04 18:00:00'
      peep.user_id = "3"
      repo.create(peep)
      all_peeps = repo.all
      expect(all_peeps).to include(
        have_attributes(
          peep_content: "I am a new test peep",
          time_of_peep: '2023-04-04 18:00:00'
        )
      )
  end

  it "deletes a peep" do
      repo = PeepsRepository.new
      repo.delete(1)
      expect(repo.all.length).to eq 2
      expect(repo.all[0].time_of_peep).to eq '2023-03-15 12:00:00'
      
  end


end
