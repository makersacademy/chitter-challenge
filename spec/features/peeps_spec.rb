require './lib/peeps'
require 'pg'

describe Peeps do
  describe ".all" do
    it "shows all peeps on the homepage" do
      con = PG.connect(dbname: "chitter")
      con.exec("INSERT INTO peeps (peep) VALUES ('this is my first peep');")
      expect(Peeps.all).to include("this is my first peep")
    end
  end
end
