require 'pg'
require './lib/peep'

describe Peep do

  subject(:peep) { described_class.new(1, "Hello World!", "Marianne", "marianneoco", "09:00") }

  it "can create a new peep" do
    expect(peep).to be_instance_of(Peep)
  end

  it "can create a new peep with an id" do
    expect(peep.id).to eq(1)
  end

  it "can create a new peep with content" do
    expect(peep.content).to eq("Hello World!")
  end

  it "has name of peep poster" do
    expect(peep.author_name).to eq("Marianne")
  end

  it "has user handle of the peep poster" do
    expect(peep.author_handle).to eq("marianneoco")
  end

  it "shows the time the peep was posted" do
    expect(peep.time).to eq("09:00")
  end

  it "can create a new entry in the database" do
    new_peep = Peep.create("Hello World!", "Marianne", "marianneoco", "09:00")
    expect(Peep.all[0]).to be_instance_of(Peep)
  end

  it "has an all method which returns an array of peeps" do
    connection = PG.connect( dbname: 'Chitter_test' )
    result = connection.exec "INSERT INTO peeps VALUES(1, 'Hello World!', 'Marianne', 'marianneoco', '09:00:00');"
    result = connection.exec "INSERT INTO peeps VALUES(2, 'Hello World!', 'Marianne', 'marianneoco', '09:00:00');"
    expect(Peep.all).to be_instance_of(Array)
    expect(Peep.all[0]).to be_instance_of(Peep)
    expect(Peep.all[1]).to be_instance_of(Peep)
    expect(Peep.all[0].id).to eq("1")
    expect(Peep.all[0].content).to eq('Hello World!')
    expect(Peep.all[0].author_name).to eq('Marianne')
    expect(Peep.all[0].author_handle).to eq('marianneoco')
    expect(Peep.all[0].time).to eq('09:00:00')
  end

end
