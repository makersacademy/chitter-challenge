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

    peeps = repo.all

    expect(peeps.length).to eq(2)
    expect(peeps.first.title).to eq('Peep 1')
    expect(peeps.first.user_id).to eq(1)
    expect(peeps.last.title).to eq('Meep')
    expect(peeps.last.user_id).to eq(2)
  end

  it "creates a peep" do
    repo = PeepRepository.new
    peep = double(:peep, title: "Doubler", content: "This is a double", time_stamp: "2021-09-07 12:20:43", user_id: 1 )
    repo.create(peep)
    peeps = repo.all

    peeps = repo.all
    expect(peeps.length).to eq 3
    expect(peeps.first.title).to eq 'Doubler'
    expect(peeps.first.content).to eq 'This is a double'
    expect(peeps.first.time_stamp).to eq '2021-09-07 12:20:43'
  end
end
