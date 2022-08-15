require "peep_repo"

def reset_seeds_table
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  seed_sql = File.read('spec/seeds/chitter_test.sql')
  connection.exec(seed_sql) 
end

RSpec.describe PeepRepository do 

  before(:each) do 
    reset_seeds_table 
  end

  it "lists the peeps posted by users" do 

    repo = PeepRepository.new 
    peeps = repo.all

    expect(peeps.length).to eq(7)
    expect(peeps[0].content).to eq("The bank has increased the interest rate")
    expect(peeps[2].user_id).to eq("1")
    expect(peeps[5].content).to eq("Bought a new coffee machine")

  end

  it "finds a peep by ID" do 

    repo = PeepRepository.new 

    peep = repo.find(4)
    
    expect(peep.content).to eq("What is with the weather")
    expect(peep.user_id).to eq("2")

  end

  it "creates a new peep" do 

    repo = PeepRepository.new

    peep = Peep.new 
    peep.content = "Going out for lunch"
    peep.timestamp = "2022-08-12 11:06:02"
    peep.user_id = 3

    repo.create(peep)

    peeps = repo.all 

    expect(peeps.length).to eq(8)
    expect(peeps.last.content).to eq("Going out for lunch")
    expect(peeps.last.user_id).to eq("3")

  end


end