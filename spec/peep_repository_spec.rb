require 'peep'
require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/accounts_and_peeps_tables.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  before(:each) do
    reset_peeps_table
  end

 
  it 'finds all peeps' do
    peep_repo = PeepRepository.new

    peeps = peep_repo.all 

    expect(peeps.length).to eq(3)
    expect(peeps.first.time).to eq('2023-05-09 11:12:00')
    expect(peeps.first.contents).to eq('I am peeping too! How cool')
    expect(peeps.first.account_id).to eq(3)
  end

  it 'adds a peep' do
    repo = PeepRepository.new
    new_peep = Peep.new

    new_peep.time = Time.now
    new_peep.contents = "we are adding a new peep!"
    new_peep.account_id = 1

    repo.add(new_peep)

    peeps = repo.all

    expect(peeps.length).to eq(4)
    expect(peeps.first.contents).to eq("we are adding a new peep!")
  end

  it 'returns the username for peep at id 1 (most recent peep)' do
    peep_repo = PeepRepository.new

    peeps = peep_repo.all 
    expect(peeps.first.contents).to eq('I am peeping too! How cool')
    expect(peeps.first.find_username).to eq('will1')
  end
end
