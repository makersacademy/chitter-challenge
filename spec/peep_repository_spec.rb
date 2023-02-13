require 'peep'
require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_app_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do 

  before(:each) do 
    reset_peeps_table
  end 

  it 'returns all peeps - unsorted' do
    repo = PeepRepository.new 

    peeps = repo.all 

    expect(peeps.length).to eq 4 
    expect(peeps.first.id).to eq "1"
    expect(peeps.first.contents).to eq "hello peeps"
    expect(peeps.first.time).to eq Time.new(2023, 1, 8, 4, 5, 6)
    expect(peeps.first.user_id).to eq "1"
  end  

  context 'returns a single peep' do 
    it 'returns peep with id 1 ' do 
      repo = PeepRepository.new 
                                                                                                          
      peep = repo.find(1)

      expect(peep.id).to eq "1"
      expect(peep.contents).to eq "hello peeps"
      expect(peep.time).to eq Time.new(2023, 1, 8, 4, 5, 6)
      expect(peep.user_id).to eq "1"
    end 

    it 'returns peep with id 1 ' do 
      repo = PeepRepository.new 

      peep = repo.find(3)

      expect(peep.id).to eq "3"
      expect(peep.contents).to eq "coding is fun!"
      expect(peep.time).to eq Time.new(2020,3,23,22,15,45)
      expect(peep.user_id).to eq "3"
    end 
  end 

  it 'creates a new peep' do 
    repo = PeepRepository.new

    peep = Peep.new
    peep.contents = 'Going shopping!'
    peep.time = Time.new(2023,2,11,18,4,15)
    peep.user_id = '2'

    repo.create(peep)

    peeps = repo.all 
    last_peep = peeps.last 

    expect(last_peep.contents).to eq 'Going shopping!'
    expect(last_peep.time).to eq Time.new(2023,2,11,18,4,15)
    expect(last_peep.user_id).to eq '2'
  end 

  it 'returns a rev chrono sorted list of peeps' do 
    repo = PeepRepository.new 

    all_peeps = repo.all
    peeps = repo.sort_peeps(all_peeps)

    expect(peeps.first.id).to eq "4"
    expect(peeps.first.contents).to eq "went fishing!"
    expect(peeps.first.time).to eq Time.new(2023,2,11,20,3,34)
    expect(peeps.first.user_id).to eq "1"

    expect(peeps.last.id).to eq '3'
    expect(peeps.last.contents).to eq "coding is fun!"
    expect(peeps.last.time).to eq Time.new(2020,3,23,22,15,45)
    expect(peeps.last.user_id).to eq "3"

  end 
  
end 
