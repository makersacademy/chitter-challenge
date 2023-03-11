require 'peep'
require 'peep_repository'

def reset_peeps_users_tables
  seed_sql = File.read('spec/peeps_users_tables.sql')
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

    expect(peeps[0].id).to eq '1'
    expect(peeps[0].content).to eq 'Just set up my chitter'
    expect(peeps[0].user_id).to eq '1'

    expect(peeps[1].id).to eq '2'
    expect(peeps[1].name).to eq 'RIP Uncle Phil'
    expect(peeps[1].user_id).to eq '2'
  end

  xit 'gets a single peep' do
    peep = @repo.find_peep(2)

    expect(peep.id).to eq '3'
    expect(peep.name).to eq 'OMDs J.cole just joined chitter!'
    expect(peep.user_id).to eq '1'
  end

  xit 'creates a peep' do
    new_peep = Peep.new
    new_peep.content = "Should I acquire twitter?"
    new_peep.user_id = 1

    @repo.create_peep(new_peep)
    peeps = @repo.all_peeps
    peeps[-1].content # => "Should I acquire twitter?"
  end
end