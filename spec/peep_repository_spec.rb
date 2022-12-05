require 'peep'
require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/chitter_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_peeps_table
  end

  it 'finds all peeps' do
    repo = PeepRepository.new

    peeps = repo.all

    expect(peeps.length).to eq(2)
    expect(peeps.first.username).to eq('JCMorgan')
    expect(peeps.first.content).to eq('First Peep!')
    expect(peeps.first.datetime).to eq('2022-12-04 12:22:50')

    expect(peeps.last.username).to eq('CoolCat23')
    expect(peeps.last.content).to eq('Hi!')
    expect(peeps.last.datetime).to eq('2022-12-04 13:01:32')
  end

  it 'finds one peep' do
    repo = PeepRepository.new

    peep = repo.find(1)

    expect(peep.username).to eq('JCMorgan')
    expect(peep.content).to eq('First Peep!')
    expect(peep.datetime).to eq('2022-12-04 12:22:50')
  end

  it 'creates a peep' do
    repo = PeepRepository.new

    new_peep = Peep.new
    new_peep.username = 'CoolCat23'
    new_peep.content = 'Hi again!'
    new_peep.datetime = '2022-12-04 13:10:50'
    repo.create(new_peep)

    peeps = repo.all

    expect(peeps.length).to eq(3)
    expect(peeps.last.username).to eq('CoolCat23')
    expect(peeps.last.content).to eq('Hi again!')
    expect(peeps.last.datetime).to eq('2022-12-04 13:10:50')
  end

end
