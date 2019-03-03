require 'database_connection'

describe Database_Connection do
  it "Sets up the database connection" do
    expect(Database_Connection.setup.db).to eq "chitter_database_test"
  end

  it "Recives a querry string and returns the result" do
    Database_Connection.setup
    peeps = Database_Connection.querry("SELECT peep FROM peeps")
    expect(peeps[0]['peep']).to eq 'This is an example peep'
  end
end
