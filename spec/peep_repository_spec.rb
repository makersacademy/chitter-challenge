require "peep_repository"


def reset_table
  seeds_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
  connection.exec(seeds_sql)
end

describe PeepRepository do
  before(:each) do
    reset_table
  end

  it 'finds all peeps' do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps.length).to eq(5)
    expect(peeps.first.content).to eq('Hey this is my funny content')
    expect(peeps.first.time).to eq('2004-10-19 10:23:54')
  end


end
