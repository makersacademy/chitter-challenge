require 'peep_repository'

RSpec.describe PeepRepository do

  def reset_peeps_table
    seed_sql = File.read('spec/seeds/seeds_peeps.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_peeps_table
  end

  it 'returns a list of all the peeps' do
    repo = PeepRepository.new

    peeps = repo.all 

    expect(peeps.length).to eq 7
    expect(peeps.first.id).to eq '1'
    expect(peeps.first.title).to eq "Cats"
  end

  it 'returns a list of all the peeps sorted in reverse chronological order' do
    repo = PeepRepository.new

    peeps = repo.sorted_by_time 

    expect(peeps.length).to eq 7
    expect(peeps.first.id).to eq '7'
    expect(peeps.first.title).to eq "Shopping Part 2"
  end

  it 'creates a new peep' do
    repo = PeepRepository.new

    new_peep = Peep.new
    new_peep.title = 'Maoam'
    new_peep.content = 'Favourite sweets'
    new_peep.time = '14:45'
    new_peep.user_id = "2"
    
    repo.create(new_peep)

    all_peeps = repo.all

    expect(all_peeps).to include (
      have_attributes(
        title: new_peep.title,
        content: new_peep.content,
        time: new_peep.time,
        user_id: new_peep.user_id
      ))
  end
end
