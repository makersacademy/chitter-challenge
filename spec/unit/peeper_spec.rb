require 'peeper'

describe Peeper do

  describe "#all" do
    it "returns all the previous peeps" do
      prime_database
      my_timeline = Peeper.all
      expect(my_timeline.first.text).to include("Has anyone seen my motivation, I seem to have lost it")
    end
  end

  describe "#post" do
    it "adds a peep to the database" do
      prime_database
      Peeper.post(new_peep: "First peep")
      timeline = Peeper.all
      expect(timeline.first.text).to eq("First peep")
    end
  end

  describe "peeps have a time stamp" do
    it "A peep has text and an automatic time stamp" do
      prime_database
      Peeper.post(new_peep: "I hope this has a time on it")
      timeline = Peeper.all
      expect { timeline.first.time }.to_not raise_error
    end
  end

end
