require "./lib/peep"

describe ".all" do
  it "Shows all peeps" do
    conn = PG.connect(dbname: "peep_test")

    #This adds the test data
    # conn.exec("INSERT INTO peeps (name) VALUES ('Jerry');")
    conn.exec("INSERT INTO peeps (peep, name) VALUES ('Hello', 'Jerry');")

    expect(Peep.all).to include("Jerry")
  end
end

describe ".create" do
  it "Creates a peep" do
    peep = Peep.create(peep: "Hello", name: "Jerry").first

    expect(peep["peep"]).to eq("Hello")
    expect(peep["name"]).to eq("Jerry")
  end
end
