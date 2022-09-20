require 'peep_repository'
require 'peep'
require 'database_connection'

# def reset_peeps_table
#   seed_sql = File.read('spec/seeds_peeps_users.sql')
#   connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test'})
#   connection.exec(seed_sql)
# end

describe PeepRepository do
  # before(:each) do 
  #   reset_peeps_table
  # end

  it 'produces a list of all peeps' do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps.first.content).to eq 'Anna peep 1'
    expect(peeps.first.date).to eq '2022-08-17 07:37:16'
    expect(peeps.first.user_id).to eq '1'
    expect(peeps.length).to eq 3
  end

  it 'adds a new peep to the database' do
    repo = PeepRepository.new
    peep = Peep.new
    peep.content = 'My new peep'
    peep.date = '2022-09-16 15:44:52'
    peep.user_id = '1'
    repo.add(peep)
    expect(repo.all.length).to eq 4
    expect(repo.all[-1].content).to eq 'My new peep'
  end
end