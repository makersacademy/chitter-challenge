require 'peep'
require 'peep_repository'

def reset_peeps_users_tables
  seed_sql = File.read('schema/peeps_users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before do 
    reset_peeps_users_tables
    @repo = PeepRepository.new
  end

  it 'gets all peeps' do
    peeps = @repo.all_peeps

    expect(peeps.length).to eq 6
    expect(peeps).to include(have_attributes(id: '1', content: 'Just set up my chitter', user_id: '1'))
    expect(peeps).to include(have_attributes(id: '2', content: 'RIP Uncle Phil', user_id: '2'))
  end

  it 'gets a single peep' do
    peep = @repo.find_peep(3)
    expect(peep).to have_attributes(id: '3', content: 'OMDs J.cole just joined chitter!', user_id: '1')
  end

  it 'creates a peep' do
    new_peep = Peep.new
    new_peep.content = "Should I acquire twitter?"
    new_peep.user_id = 1

    @repo.create_peep(new_peep)
    peeps = @repo.all_peeps
    expect(peeps).to include(have_attributes(id: '7', content: 'Should I acquire twitter?', user_id: '1'))
  end
end