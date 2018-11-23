require 'peep'

describe Peep do
  describe ".list" do

    it "should display a list of peeps with content" do
      Peep.add("Hello world!")
      Peep.add("New to peeps")
      Peep.add("Peep show")
      peeps = Peep.list

      expect(peeps.length).to eq 3
      expect(peeps[0].content).to eq("Hello world!")
      expect(peeps[1].content).to eq("New to peeps")
      expect(peeps[2].content).to eq("Peep show")

    end

    it "should display a list of peeps with timestamps " do
      peep_time = Time.now.to_s.chomp(" +0000") # May be way to get timestamp without timezone

      Peep.add("Time check", peep_time)

      peeps = Peep.list
      expect(peeps[0].timestamp).to eq(peep_time)
    end

    it "should display list of tweets in reverse chronological order" do
      Peep.add("3rd on list", "2018-11-23 10:40:31")
      Peep.add("1st on list", "2018-11-22 10:40:31")
      Peep.add("2nd on list", "2018-11-23 09:40:31")

      peeps = Peep.list

      expect(peeps[0].content).to eq("1st on list")
      expect(peeps[1].content).to eq("2nd on list")
      expect(peeps[2].content).to eq("3rd on list")
    end
  end

  describe ".add" do
    it "should be able to add a peep with content to the database" do
      connection = PG.connect(dbname: 'chitter_test')

      Peep.add("Check one two")

      peeps = Peep.list

      expect(peeps[0].content).to eq("Check one two")
    end
  end
end
