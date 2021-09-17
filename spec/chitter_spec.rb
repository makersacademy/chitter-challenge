require 'chitter'

describe Chitter do
  it "can post a peep to the database and view it" do
    connection = PG.connect(dbname: 'chitter_test')

    Chitter.add("Test peep 1")

    expect(Chitter.all).to include "Test peep 1"
  end
end