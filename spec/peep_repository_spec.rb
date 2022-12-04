require "database_connection"
require "peep_repository"
require 'pg'

def reset_peeps_table
  seed_sql = File.read('spec/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  it "Get all peeps" do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps.length).to eq 6

    expect(peeps[0].id).to eq 1
    expect(peeps[0].contents).to eq 'Contents 1'
    expect(peeps[0].time).to eq '2022-12-01 01:08:54.193'
    expect(peeps[0].account_id).to eq 1

    expect(peeps[1].id).to eq 2
    expect(peeps[1].contents).to eq 'Contents 2'
    expect(peeps[1].time).to eq '2022-12-01 05:08:54.193'
    expect(peeps[1].account_id).to eq 2
  end

  it "Get a single peep" do
    repo = PeepRepository.new
    peep = repo.find(3)

    expect(peep.id).to eq 3
    expect(peep.contents).to eq 'Contents 3'
    expect(peep.time).to eq '2022-12-01 10:08:54.193'
    expect(peep.account_id).to eq 3
  end

  it "Create a single peep" do
    repo = PeepRepository.new
    peep = Peep.new
    peep.contents = 'Something controversial'
    peep.time = '2022-12-02 10:10:10.193'
    peep.account_id = 1
    repo.create(peep)

    all_peeps = repo.all
    expect(all_peeps.last.id).to eq 7
    expect(all_peeps.last.contents).to eq 'Something controversial'
    expect(all_peeps.last.account_id).to eq 1
    expect(all_peeps.last.time).to eq '2022-12-02 10:10:10.193'
  end

  it "Delete a single peep" do
    repo = PeepRepository.new
    repo.delete(3)
    peeps = repo.all
    expect(peeps.length).to eq 5
    expect(peeps[0].id).to eq 1
    expect(peeps[1].id).to eq 2
    expect(peeps[2].id).to eq 4
  end

  it "Update a single peep" do
    repo = PeepRepository.new
    new_peep = repo.find(2)
    new_peep.contents = "Contents 5"
    new_peep.time = '2022-12-03 10:10:10.193'
    repo.update(new_peep)
    peep = repo.find(2)
    expect(peep.contents).to eq "Contents 5"
    expect(peep.time).to eq '2022-12-03 10:10:10.193'
    expect(peep.account_id).to eq 2
  end

  it "create fails if account_id doesn't exist in accounts table" do
    repo = PeepRepository.new
    peep = Peep.new
    peep.account_id = 100
    peep.contents = "Something"
    expect{repo.create(peep)}.to raise_error PG::ForeignKeyViolation
  end

  it "update fails if account_id doesn't exist in accounts table" do
    repo = PeepRepository.new
    peep = repo.find(2)
    peep.account_id = 100
    expect{repo.update(peep)}.to raise_error PG::ForeignKeyViolation
  end
end