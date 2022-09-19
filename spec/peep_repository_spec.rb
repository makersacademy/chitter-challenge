require 'peep'
require 'peep_repository'

def reset_peeps_table
  seed = File.read('spec/seeds/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
  connection.exec(seed)
end

describe PeepRepository do
  before(:each) do
    reset_peeps_table
  end

  it 'finds all peeps' do
    repo = PeepRepository.new
    peeps = repo.all

    expect(peeps.length).to eq 10
    expect(peeps.first.content).to eq('Hello')
    expect(peeps.first.peep_time).to eq('2022-09-15 11:41:22')
    expect(peeps.first.user_id).to eq(1)
  end

  it 'find one specific peep' do
    repo = PeepRepository.new
    peep = repo.find(2)

    expect(peep.id).to eq(2)
    expect(peep.content).to eq('Hi')
    expect(peep.peep_time).to eq('2022-09-14 10:32:02')
    expect(peep.user_id).to eq(1)
  end

  it 'creates an peep' do
    repo = PeepRepository.new

    new_peep = Peep.new
    new_peep.content = 'Welcome to the Party'
    new_peep.peep_time = '2022-09-15 13:37:22'
    new_peep.user_id = 2
    repo.create(new_peep)

    peeps = repo.all

    expect(peeps.length).to eq(11)
    expect(peeps.last.content).to eq('Welcome to the Party')
    expect(peeps.last.user_id).to eq(2)
  end
end
