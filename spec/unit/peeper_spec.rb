require 'peeper'

describe Peeper do

  describe "#all" do

    it "returns all the previous peeps" do
      prime_database
      my_timeline = Peeper.all
      expect(my_timeline.first.text).to include("Holy moly, what is this site meant to be??")
    end

  end

  describe "#post" do

    it "adds a peep to the database" do
      prime_database
      Peeper.post(new_peep: "First peep")
      timeline = Peeper.all
      expect(timeline.last.text).to eq("First peep")
    end
  end

end
