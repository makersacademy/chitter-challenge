require "./lib/peep"

describe Peep do
  
  describe ".add" do
    it "adds a new peep" do
      Peep.add("This is a post.", "1")
      peep_body = Peep.all[0].body
      expect(peep_body).to include("This is a post.")
    end
  end

  describe ".all" do
    it "will return the body of the peep" do
      Peep.add("This is a post.", 1)
      Peep.add("This is another post.", 2)
      Peep.add("Yet again, this is a new post.", 3)
      
      peeps = Peep.all
      peep = Peep.all.first

      expect(peeps.length).to eq(3)
      expect(peep.body).to eq("Yet again, this is a new post.")
      expect(peep).to respond_to(:posted_at)
      expect(peep).to respond_to(:id)
    end
  end

end
