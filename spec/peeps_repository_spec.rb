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
    repo = PeepsRepository.new(UserRepository.new)
    expect(repo.all.length).to eq 3
    expect(repo.all[0].peep_content).to eq 'Welcome to chitter'
    expect(repo.all[2].time_of_peep).to eq '2023-03-27 17:00:00'
    expect(repo.all[1].user_id.to_i).to eq 6
  end

  it 'finds a peep by id' do
    repo = PeepsRepository.new(UserRepository.new)
    peep = repo.find(1)
    expect(peep.peep_content).to eq 'Welcome to chitter'
    expect(peep.user_id.to_i).to eq 5
    expect(Time.parse(repo.all[2].time_of_peep)).to eq Time.parse('2023-03-27 17:00:00')

  end

  it 'creates a new peep' do
    repo = PeepsRepository.new(UserRepository.new)
    peep = Peep.new(
      id: 4,
      peep_content: "I am a new test peep",
      time_of_peep: Time.parse('2023-04-04 18:00:00'),
      user_id: 2,
      username: 'FitnessFanatic'
    )
    
    repo.create(peep)
    all_peeps = repo.all
  
    expect(repo.all[3]).to have_attributes(
      id: "4",
      peep_content: "I am a new test peep",
      user_id: "2",
      time_of_peep: "2023-04-04 18:00:00",
      username: "FitnessFanatic"
    )
    
  end
  
  
  

  

  it 'deletes a peep' do
    repo = PeepsRepository.new(UserRepository.new)
    repo.delete(1)
    all_peeps = repo.all
    expect(all_peeps.length).to eq 2
    expect(Time.parse(all_peeps[1].time_of_peep)).to eq Time.parse('2023-03-27 17:00:00')
  end
end
