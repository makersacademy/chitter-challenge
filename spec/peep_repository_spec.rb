require 'peep_repository'

RSpec.describe PeepRepository do
  def reset_peeps_table
    seed_sql = File.read('spec/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_peeps_table
  end

  it "should get all peeps" do
    repo = PeepRepository.new
    peeps = repo.all

    expect(peeps.length).to eq 5
    expect(peeps[0].id).to eq '1'
    expect(peeps[0].content).to eq 'Ed BallS'
    expect(peeps[0].time).to eq '07:00:00'
    expect(peeps[0].name).to eq 'Shah'
    expect(peeps[0].username).to eq 'shussain'
    expect(peeps[1].id).to eq '2'
    expect(peeps[1].content).to eq 'im innocent come find me'
    expect(peeps[1].time).to eq '10:00:00'
    expect(peeps[1].name).to eq 'SBF'
    expect(peeps[1].username).to eq 'SBFFTX'
  end

  it "should create a new peep" do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.content = 'WHY AINT HE GONE YET'
    new_peep.time = '3:00:00'
    new_peep.name = 'Lamar'
    new_peep.username = 'LJEra'
    new_peep.user_id = '5'

    repo.create(new_peep)
    peeps = repo.all
    last_peep = peeps.last

    expect(last_peep.name).to eq 'Lamar'
    expect(last_peep.time).to eq '03:00:00'
    expect(last_peep.username).to eq 'LJEra'
    expect(last_peep.user_id).to eq '5'
  end 

end 
