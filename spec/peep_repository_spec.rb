require 'peep_repository'
require 'peep'

RSpec.describe PeepRepository do 

  def reset_peeps_table
    seed_sql = File.read('spec/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_peeps_table
  end
  it 'gets all peeps' do
    repo = PeepRepository.new

    peeps = repo.all
    expect(peeps.length).to eq(4)
    expect(peeps.first.id).to eq("1") 
    expect(peeps.first.context).to eq('peep 1 context') 
    expect(peeps.first.time_and_date).to eq('2022-10-06 09:46:42') 
    expect(peeps.first.user_id).to eq('1') 
  end
  it 'creates a new peep' do
    repo = PeepRepository.new

    peep = Peep.new
    peep.context = 'peep 5 context'
    peep.time_and_date = '2022-10-06 10:40:42'
    peep.user_id = '1'

    repo.create(peep)

    peeps = repo.all

    expect(peeps.length).to eq(5) 

    last_peep = peeps.last
    
    expect(last_peep.context).to eq('peep 5 context') 
    expect(last_peep.time_and_date).to eq('2022-10-06 10:40:42') 
  end
end