require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds_users_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do

  before(:each) do 
    reset_peeps_table
  end

  it "returns all peeps" do
    repo = PeepRepository.new

    peeps = repo.all

    expect(peeps.length).to eq 3

    expect(peeps[0].id).to eq 1
    expect(peeps[0].content).to eq 'Mag mag mag Pie'
    expect(peeps[0].date_time).to eq '2023-01-08 10:00:00'
    expect(peeps[0].user_id).to eq 1

    expect(peeps[1].id).to eq 2
    expect(peeps[1].content).to eq 'Mock mock mock Ingbird'
    expect(peeps[1].date_time).to eq '2023-01-10 13:30:00'
    expect(peeps[1].user_id).to eq 2

    expect(peeps[2].id).to eq 3
    expect(peeps[2].content).to eq 'Night night night Ingale'
    expect(peeps[2].date_time).to eq '2023-01-13 18:20:00'
    expect(peeps[2].user_id).to eq 3
  end

  it "returns a single peep with the given id" do
    repo = PeepRepository.new

    peep = repo.find(1)

    expect(peep.content).to eq 'Mag mag mag Pie'
    expect(peep.date_time).to eq '2023-01-08 10:00:00'
    expect(peep.user_id).to eq 1
  end

  it "creates a new peep" do
    repo = PeepRepository.new

    peep = Peep.new
    peep.content = 'Pie pie pie Mag'
    peep.date_time = '2023-01-09 11:00:00'
    peep.user_id = 2

    repo.create(peep)

    all_peeps = repo.all 

    expect(all_peeps).to include(
      have_attributes(
        content: peep.content,
        date_time: peep.date_time,
        user_id: peep.user_id
      )
    )
  end

  it "deletes a peep with the given id" do
    repo = PeepRepository.new

    repo.delete(2)

    all_peeps = repo.all


  end

end