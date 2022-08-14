require 'peep'
require 'pg'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Peep do
  before(:each) do 
    reset_peeps_table
    ActiveRecord::Base.establish_connection(
      adapter:  'postgresql',
      database: 'chitter_test'
    )
  end

  it 'gets all peeps' do
    peeps = Peep.all
    expect(peeps.length).to eq 4
    expect(peeps.first.content).to eq 'I love cricket'
    expect(peeps.first.date_time_created).to eq '2022-08-11 18:16:04'
    expect(peeps.first.user_id).to eq 2
  end

  it 'creates a peep' do
    Peep.create(
      content: 'content',
      date_time_created: '2022-08-13 12:50:33',
      user_id: 4
    )
    expect(Peep.all.length).to eq 5
    expect(Peep.last.id).to eq 5
    expect(Peep.last.content).to eq 'content'
    expect(Peep.last.date_time_created).to eq '2022-08-13 12:50:33'
    expect(Peep.last.user_id).to eq 4
  end

  it 'returns date_time_created as formatted string' do
    expect(Peep.first.date_time_created_formatted_string).to eq "06:16 PM Thursday 11 August 2022"
  end

  it "gets the peep's user's name" do
    expect(Peep.first.name).to eq 'Daniel Roma'
  end

  it "gets the peep's user's username" do
    expect(Peep.first.username).to eq 'BeatTheHeat'
  end

end
