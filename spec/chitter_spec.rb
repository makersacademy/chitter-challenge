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

    expect(Chitter.all).to start_with "Anon<br>MOST RECENT PEEP"
  end

  it "will contain a time and date" do
    connection = PG.connect(dbname: 'chitter_test')

    Chitter.add("Test peep 2")

    expect(Chitter.all).to include "2021"
  end

  it "will contain a default username if one if not provided" do
    connection = PG.connect(dbname: 'chitter_test')

    Chitter.add("Test peep 3")

    expect(Chitter.all).to include "Anon"
  end
end
