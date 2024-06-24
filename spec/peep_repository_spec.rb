require "peep_repository" 
require "peep" 
  
describe PeepRepository do 
  
  def reset_peeps_table
    seed_sql = File.read('spec/seeds/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_data' })
    connection.exec(seed_sql)
  end


  before(:each) do 
    reset_peeps_table
  end

  it "returns a list of the peeps" do
    repo = PeepRepository.new
    peeps = repo.all

    expect(peeps.length).to eq 2
    expect(peeps[-1].id).to eq 2
    expect(peeps[-1].content).to eq 'My Lord, what services can I offer you?'
    expect(peeps[-1].date).to eq '12/03'
    expect(peeps[-1].time).to eq '17:05'
    expect(peeps[-1].user_id).to eq 2
  end

  it "throws an error if the id is not an Integer" do
    repo = PeepRepository.new
    expect{ repo.find("ciao") }.to raise_error "id must be an Integer"
  end

  it 'returns a peep by id' do 
    repo = PeepRepository.new
    peep = repo.find(1)

    expect(peep.length).to eq 1
    expect(peep[0].id).to eq 1
    expect(peep[0].content).to eq 'Welcome to Chitter! My first web app.'
    expect(peep[0].date).to eq '12/03'
    expect(peep[0].time).to eq '17:04'
    expect(peep[0].user_id).to eq 1
  end

  it "adds a new peep to the database" do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.content = "Good morning!"
    new_peep.date = "12/03"
    new_peep.time = '18:10'
    new_peep.user_id = 2

    repo.create(new_peep)
    peeps = repo.all

    expect(peeps.length).to eq 3
    expect(peeps[-1].id).to eq 3
    expect(peeps[-1].content).to eq "Good morning!"
    expect(peeps[-1].date).to eq "12/03"
    expect(peeps[-1].time).to eq '18:10'
    expect(peeps[-1].user_id).to eq 2
  end

  it "deletes a peep from the database" do
    repo = PeepRepository.new
    repo.delete(1)
    peeps = repo.all

    expect(peeps.length).to eq 1
    expect(peeps[-1].content).to eq 'My Lord, what services can I offer you?'
    expect(peeps[0].content).to eq 'My Lord, what services can I offer you?'
  end
end