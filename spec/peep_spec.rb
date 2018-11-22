require 'peep'

describe Peep do
  describe ".list" do
    it "should display a list of peeps" do
      connection = PG.connect(dbname: 'chitter_test')
      
      connection.exec("INSERT INTO peeps (content) VALUES ('Hello world!');")
      connection.exec("INSERT INTO peeps (content) VALUES ('New to peeps');")
      connection.exec("INSERT INTO peeps (content) VALUES ('Peep show');")

      expect(Peep.list).to include("Hello world!")
      expect(Peep.list).to include("New to peeps")
      expect(Peep.list).to include("Peep show")
    end
  end
end
