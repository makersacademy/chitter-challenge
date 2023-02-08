require 'peeps_repository'

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
end