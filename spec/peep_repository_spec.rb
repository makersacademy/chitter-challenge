require 'peep_repository'
require 'peep'

describe PeepRepository do

def reset_chitter_tables
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end


  before(:each) do 
    reset_chitter_tables
  end

  it 'returns list of all peeps' do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps.length).to eq 2
    expect(peeps[0].id).to eq 1
    expect(peeps[0].peep_content).to eq 'I am going to tell you a story...'
    expect(peeps[0].peep_date).to eq '20:55 13/01/2023'
    expect(peeps[1].id).to eq 2
    expect(peeps[1].peep_content).to eq 'Dear, dear Anne...'
    expect(peeps[1].peep_date).to eq "20:40 13/01/2023"
  end

  it 'returns a single peep specified by id' do
    repo = PeepRepository.new
    single_peep = repo.find(1)
    expect(single_peep[0].id).to eq 1
    expect(single_peep[0].peep_content).to eq 'I am going to tell you a story...'
    expect(single_peep[0].peep_date).to eq '20:55 13/01/2023'
  end

  it 'creates a new peep' do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.peep_content = 'Anything you say, Mr Smiley.'
    new_peep.peep_date = '21:05 13/01/2023'
    repo.create(new_peep)
    find_new_peep = repo.find(3)
    expect(find_new_peep[0].peep_content).to eq 'Anything you say, Mr Smiley.'
    expect(find_new_peep[0].peep_date).to eq '21:05 13/01/2023'
  end

  it 'deletes a single peep' do
    repo = PeepRepository.new
    repo.delete(1)
    peeps = repo.all
    expect(peeps.length).to eq 1
    expect(peeps[0].peep_content).to eq 'Dear, dear Anne...'
    expect(peeps[0].peep_date).to eq "20:40 13/01/2023"
  end

end










