require "peeps_repository"

def reset_peeps_table
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepsRepository do
  before(:each) do 
    reset_peeps_table
  end

  it "gets all peeps" do
    repo = PeepsRepository.new

    peeps = repo.all
    
    expect(peeps.length).to eq 3
    
    expect(peeps[0].id).to eq ('1')
    expect(peeps[0].message).to eq ('A good day')
    expect(peeps[0].time_of_post).to eq ('2023-03-09 10:15:30.123456')
    expect(peeps[0].user_id).to eq ('1')
    
    expect(peeps[1].id).to eq ('2')
    expect(peeps[1].message).to eq ('A bad day')
    expect(peeps[1].time_of_post).to eq ('2023-03-08 10:15:30.123456')
    expect(peeps[1].user_id).to eq ('2')
  end

  it "gets a single peep" do
    repo = PeepsRepository.new

    peep = repo.find(1)

    expect(peep.id).to eq ('1')
    expect(peep.message).to eq ('A good day')
    expect(peep.time_of_post).to eq ('2023-03-09 10:15:30.123456')
    expect(peep.user_id).to eq ('1')
  end

  it "creates a single peep record" do
    repo = PeepsRepository.new

    peep = Peeps.new
    peep.message = "A really good day"
    peep.time_of_post = '2023-03-06 10:15:30.123456'
    peep.user_id = "3"

    repo.create(peep)
    peeps = repo.all

    last_peep = peeps.last
    expect(last_peep.message).to eq 'A really good day'
    expect(last_peep.time_of_post).to eq "2023-03-06 10:15:30.123456"
    expect(last_peep.user_id).to eq '3'
  end

  it "updates a single peep record" do
    repo = PeepsRepository.new

    peep = repo.find(1)

    peep.message = "An alright day"
    peep.time_of_post = "2023-03-06 10:15:30.123456"
    peep.user_id = '2'

    repo.update(peep)

    updated_peep = repo.find(1)

    expect(updated_peep.message).to eq "An alright day"
    expect(updated_peep.time_of_post).to eq "2023-03-06 10:15:30.123456"
    expect(updated_peep.user_id).to eq '2'
  end
end