require 'peep'
require 'peep_repository'
require_relative './reset_database_tables'

describe PeepRepository do
  before(:each) do 
    ResetDatabaseTables.new.reset
  end

  it '#all returns all peeps' do
    repo = PeepRepository.new
    peeps = repo.all
    
    expect(peeps.length).to eq(8)
    expect(peeps.first.id).to eq(1)
    expect(peeps.first.content).to eq('Hello, I am Wendy!')
    expect(peeps.first.date_time).to eq('2022-01-01 01:01:01')
    expect(peeps.first.user_f_name).to eq('Wendy')
    expect(peeps.first.user_handle).to eq('wendy0')    
  end

  it '#find returns one peep specified by id' do
    repo = PeepRepository.new
    peep = repo.find(4)
    
    expect(peep.id).to eq(4)
    expect(peep.content).to eq('Could I BE more sorry?')
    expect(peep.date_time).to eq('2022-04-04 04:04:04')
    expect(peep.user_f_name).to eq('Chandler')
    expect(peep.user_handle).to eq('chandler0')
  end

  it '#create creates a peep' do
    peep = Peep.new
    peep.content = ('I\'m fine!!!!')
    peep.date_time = ('2022-09-09 09:09:09')
    peep.user_f_name = ('Ross')
    peep.user_handle = ('ross0')

    repo = PeepRepository.new
    repo.create(peep)
    peeps = repo.all

    expect(peeps.length).to eq(9)
    expect(peeps.last.id).to eq(9)
    expect(peeps.last.content).to eq('Peep 9')
    expect(peeps.last.date_time).to eq('2022-09-09 09:09:09')
    expect(peeps.last.user_f_name).to eq('Ross')
    expect(peeps.last.user_handle).to eq('ross0')
  end
end
