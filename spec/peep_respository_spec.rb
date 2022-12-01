require 'peep_repository'
require 'peep'

def reset_peeps_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  # (your tests will go here).


  it "returns all peeps" do
    repo = PeepRepository.new

    peeps = repo.all

    expect(peeps.length).to eq 3

    expect(peeps[0].id).to eq '1'
    expect(peeps[0].content).to eq 'peep 1'
    expect(peeps[0].user_id).to eq '1'

    expect(peeps[1].id).to eq '2'
    expect(peeps[1].content).to eq 'peep 2'
    expect(peeps[1].user_id).to eq '2'
  end

  it "returns one peep based on id" do
    repo = PeepRepository.new

    peep = repo.find(1)

    expect(peep.id).to eq '1'
    expect(peep.content).to eq 'peep 1'
    expect(peep.user_id).to eq '1'
  end

  it "creates new peep" do
    repo = PeepRepository.new

    new_peep = Peep.new
    new_peep.content =  'peep 4'
    new_peep.user_id = 2
    repo.create(new_peep)

    peeps = repo.all

    expect(peeps.last.content).to eq 'peep 4'
    expect(peeps.last.date_time).to include '2022-12-01'
    expect(peeps.last.user_id).to eq '2'
  end

end