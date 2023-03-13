require 'peep_repository'
require 'peep_model'

def reset_peeps_table
    seed_sql = File.read('spec/seeds_peeps_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitterdb_test' })
    connection.exec(seed_sql)
end
  
RSpec.describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end
  
  it 'Returns all peeps that belong to a user.' do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps.length).to eq 4
    expect(peeps[0].user_id).to eq 1
    expect(peeps[0].peep_content).to eq 'First peep'
    expect(peeps[0].peep_post_date).to eq '2023-03-12 00:00:00'

    expect(peeps[1].user_id).to eq 2
    expect(peeps[1].peep_content).to eq 'Second peep'
    expect(peeps[1].peep_post_date).to eq '2023-03-13 00:00:00'
  end

  it 'Finds a single peep.' do
    repo = PeepRepository.new
    peep = repo.find(2)
    expect(peep.user_id).to eq 2
    expect(peep.peep_content).to eq 'Second peep'
    expect(peep.peep_post_date).to eq '2023-03-13 00:00:00'
  end

  it 'Creates a peep.' do
    repo = PeepRepository.new
    peeps = repo.all
    peep = Peep.new
    peep.peep_content = 'Hello all you peepers, not peppers!'
    peep.peep_post_date = '2023-03-14 00:00:00'
    peep.user_id = 3
    repo.create(peep)
    new_peep = repo.find(5)
    expect(peep.user_id).to eq 3
    expect(peep.peep_content).to eq 'Hello all you peepers, not peppers!'
    expect(peep.peep_post_date).to eq '2023-03-14 00:00:00'
    expect(peeps.length).to eq 4
  end

  it 'Updates a peep' do
    repo = PeepRepository.new
    peep = repo.find(1)
    peep.peep_content = 'Hello all you peepers! (edited)'
    repo.update(peep)
    expect(peep.peep_content).to eq 'Hello all you peepers! (edited)'
  end

  it 'Deletes a peep' do
    repo = PeepRepository.new
    peeps = repo.all
    new_peep1 = Peep.new
    new_peep1.peep_content = 'Fifth peep'
    new_peep1.peep_post_date = '2023-03-14 00:00:00'
    repo.create(new_peep1)
    new_peep2 = Peep.new
    new_peep2.peep_content = 'Sixth peep'
    new_peep2.peep_post_date = '2023-03-15 00:00:00'
    repo.create(new_peep2)
    repo.delete_peep(5)
    peeps = repo.all
    expect(peeps.length).to eq 5
    expect(peeps.last.peep_content).to eq 'Sixth peep'
  end
end
