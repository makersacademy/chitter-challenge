require 'peep_repository'
require 'pg'
require 'peep'
require 'database_connection'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  before(:each) do
    reset_peeps_table
    @repo = PeepRepository.new
  end

  it 'returns a list of peeps' do
    expect(@repo.all.length).to eq 6
    expect(@repo.all.first.id.to_i).to eq 1
    expect(@repo.all.first.time_posted).to eq '2023-02-10 01:45:00'
    expect(@repo.all.last.message).to eq 'peeping once more'
  end

  it 'creates a new peep with date and time it was created' do
    new_peep = double :peep, id: 7, message: 'chitter is great', time_posted: Time.now.strftime("%Y-%m-%d %H:%M:%S"), user_id:3
  
    @repo.create(new_peep)
  
    expect(@repo.all.last.id.to_i).to eq 7
    expect(@repo.all.last.message).to eq 'chitter is great'
    expect(@repo.all.last.time_posted).to eq Time.now.strftime("%Y-%m-%d %H:%M:%S")
    expect(@repo.all.last.user_id.to_i).to eq 3
  end
end