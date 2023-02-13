require 'peep_repository'

def reset_tables
  seed_sql = File.read('spec/spec_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end
describe PeepRepository do
  before(:each) do 
    reset_tables
  end
  it "returns all peeps in table" do
    records = PeepRepository.new
    peeps = records.all
    expect(peeps.size).to eq 5
    expect(peeps[2].id).to eq '3'
    expect(peeps[3].post_date).to eq '2023-02-01'
    expect(peeps[0].post_time).to eq '09:12:00'
  end

  it "creates a new peep" do
    records = PeepRepository.new
    peep = Peep.new
    peep.message = "Does this thing work?"
    peep.post_time = "11:15:00"
    peep.post_date = "2023-02-01"
    peep.user_id = "3"
    records.create(peep)
    all_peeps = records.all
    expect(all_peeps).to include(
      have_attributes(
        message: "Does this thing work?",
        post_time: "11:15:00"
      )
    )
  end

  it "deletes a peep" do
    records = PeepRepository.new
    records.delete(1)
    expect(records.all.size).to eq 4
    records.delete(5)
    all_peeps = records.all
    expect(all_peeps.size).to eq 3
    expect(all_peeps.last.post_time).to eq "10:43:00"
  end
end