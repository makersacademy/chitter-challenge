require 'chitter'

describe Chitter do
  it "can post a peep to the database and view it" do
    connection = PG.connect(dbname: 'chitter_test')

    Chitter.add("Test peep 1")

    expect(Chitter.all).to include "Test peep 1"
  end

  it "will post the peeps in reverse chronological order" do
    connection = PG.connect(dbname: 'chitter_test')

    Chitter.add("An older peep")
    Chitter.add("MOST RECENT PEEP")

    expect(Chitter.all).to eq "MOST RECENT PEEP<br><br>An older peep"
  end
end
