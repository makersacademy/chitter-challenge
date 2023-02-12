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
end