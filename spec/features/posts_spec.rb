require './lib/posts'
require 'pg'

describe Posts do
  describe ".all" do
    it "shows all peeps on the homepage" do
      con = PG.connect(dbname: 'chitter_test')
      con.exec("INSERT INTO peeps (peep) VALUES ('this is my first peep');")
      expect(Posts.all).to include("this is my first peep")
    end
  end

  describe ".add" do
    it "adds new peep to the set of peeps" do
      Posts.add("this is another peep")
      expect(Posts.all).to include("this is another peep")
    end
  end
end
