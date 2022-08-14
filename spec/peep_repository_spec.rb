require 'peep_repository'
require 'peep'
require 'date'

def reset_chitter_table
  seed_sql = File.read('spec/seeds/seeds_chitter_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_chitter_table
  end

  it "returns a list of all peeps" do
    repository = PeepRepository.new

    peeps = repository.all

    expect(peeps.length).to eq 3

    expect(peeps[0].content).to eq 'Hello'
    expect(peeps[0].date_time).to eq '2022-06-08 12:00:00'
    expect(peeps[0].user_id).to eq 1

 
    expect(peeps[1].content).to eq "It is sunny today"
    expect(peeps[1].date_time).to eq '2022-08-03 11:00:00'
    expect(peeps[1].user_id).to eq 1
  end

  it "adds a peep to chitter" do
    repository = PeepRepository.new
    peep = Peep.new
    peep.content = "What's everyone's plans tonight?"
    peep.user_id = 2
    repository.create(peep)

    peeps = repository.all

    expect(peeps.length).to eq 4
    expect(peeps.last.content).to eq "What's everyone's plans tonight?"
    expect(peeps.last.user_id).to eq 2
  end
end