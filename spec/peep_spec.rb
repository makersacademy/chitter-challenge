require 'peep'

describe Peep do
  
  describe ".view" do

    it "returns all peeps" do
      Peep.create("Test peep one")
      Peep.create("Test peep two")
      expect(Peep.view[0].body).to include("Test peep one")
      expect(Peep.view[1].body).to include("Test peep two")
    end
  end

  describe ".create" do
    it "creates a new peep" do
      Peep.create("Test Peep")
      expect(Peep.view[0].body).to include("Test Peep")
    end

    it "gives the correct time" do
      Peep.create("Test Peep")
      expect(Peep.view[0].time).to eq (Time.now.strftime("%k:%M"))
    end
  end

end
