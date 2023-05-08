require 'peep'
require 'peep_repository'


RSpec.describe PeepRepository do
  
  def reset_chitter_table
    seed_sql = File.read('spec/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database' })
    connection.exec(seed_sql)
  end


  before(:each) do 
    reset_chitter_table
  end

  context 'return of peeps in varying formats' do
    it 'returns all peeps' do
      repo = PeepRepository.new

      peeps = repo.all
      expect(peeps.length).to eq(2)
      expect(peeps.first.id).to eq('1')
      expect(peeps.first.content).to eq('First Peep!')
    end    
  end
  
  it 'creates a new peep' do
    repo = PeepRepository.new

    peep = Peep.new
    peep.content = 'Hello World'
    peep.time = '10-02-2023 12:00:00'
    peep.user_id = '1'

    repo.create(peep)

    peep = repo.all

    last_peep = peep.last
    expect(last_peep.content).to eq('Hello World')
    expect(last_peep.time).to eq('2023-10-02 12:00:00')
    expect(last_peep.user_id).to eq('1')
  end
end