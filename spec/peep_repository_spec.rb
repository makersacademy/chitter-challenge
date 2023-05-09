require 'peep'
require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe Peep do

  before(:each) do
    reset_peeps_table
  end

  it 'finds all peeps' do
    peep_repo = PeepRepository.new

    peeps = peep_repo.all 

    expect(peeps.length).to eq(3)
    expect(peeps.first.time).to eq('2023-05-09 11:09:00')
    expect(peeps.first.contents).to eq('hello, this is the first peep!')
    expect(peeps.first.account_id).to eq(1)
  end

end