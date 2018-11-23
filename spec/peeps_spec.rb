require 'peeps'

describe Peeps do

  it "should be able to post a list of peeps" do
    connection = PG.connect(dbname: 'chitter_database_test')

     peep = Peeps.all

     connection.exec("INSERT INTO peeps (content) VALUES ('Is this working?');")
     connection.exec("INSERT INTO peeps (content) VALUES ('I overshare on social media!');")
     connection.exec("INSERT INTO peeps (content) VALUES ('Does this have a different timestamp.');")

     expect(peep).to include("Is this working?")
     expect(peep).to include("I overshare on social media!")
     expect(peep).to include("Does this have a different timestamp.")
  end
end
