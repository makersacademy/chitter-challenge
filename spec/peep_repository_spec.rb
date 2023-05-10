require 'peep_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_tables.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_tables
  end

  it "finds all peeps" do
    repo = PeepRepository.new

    peeps = peeps.all

    expect(peeps.length).to eq(12)
    expect(peeps.first.title).to eq('Peep 1')
    expect(peeps.first.user_id).to eq(1)
  end
end