require "./lib/peep"

describe ".all" do
  it "Shows all peeps" do
    conn = PG.connect(dbname: "peep_test")

    #This adds the test data
    conn.exec("INSERT INTO peeps (peep) VALUES ('Hello');")

    expect(Peep.all).to include("Hello")
  end
end

describe ".create" do
  it "Creates a peep" do
    peep = Peep.create(peep: "Hello").first

    expect(peep["peep"]).to eq("Hello")
  end
end
