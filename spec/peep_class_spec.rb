require "peep"

describe Peep do
  describe ".all" do
    it "returns a list of peeps" do
      connection = PG.connect(dbname: 'peeps_manager_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('Hello everyone!')")
      
      peeps = Peep.all
      p peeps

      expect(peeps).to include("Hello everyone!")
    end
  end

  describe ".create" do
    it "creates a new peep" do
      Peep.create(message: "Hello everyone!")

      expect(Peep.all).to include("Hello everyone!")
    end
  end


end