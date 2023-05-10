require 'peep_repository'
require 'peep'


def reset_users_table
    seed_sql = File.read('spec/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end
  
  describe PeepRepository do
    before(:each) do
      reset_users_table
    end
  
  it 'returns a list of all peeps' do
        repo = PeepRepository.new
        peeps = repo.all
        expect(peeps.length).to eq(2)
        expect(peeps[0].id).to eq(1)
        expect(peeps[0].content).to eq('Do the solo chitter project')
  end

  it 'finds a single peep' do 
    repo = PeepRepository.new
    peep = repo.find(1)
    expect(peep.id).to eq(1)
    expect(peep.user_id).to eq(1)
  end

  it 'creates a new peep' do 
    repo = PeepRepository.new

    new_peep = Peep.new
    new_peep.content = 'Good morning'
    new_peep.time = '2023-01-08 10:05:06 '
    new_peep.user_id = '2'
    repo.create(new_peep)

    peeps = repo.all
    expect(peeps.length).to eq(3)
    expect(peeps.last.content).to eq('Good morning')
    expect(peeps.last.user_id).to eq(2)
  end



end