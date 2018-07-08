require 'peep'

describe Peep do
  describe ".all" do
    it 'should return all peeps' do
      peep_1 = Peep.create(posts_a_peep: "first message")
      peep_2 = Peep.create(posts_a_peep: "second message")

      expected_peeps = [ peep_1, peep_2 ]

      expect(Peep.all).to eq expected_peeps
    end
  end


  describe ".create" do
    it "should create a new peep" do
      peep = Peep.create(posts_a_peep: "this a created peep")
      expect(Peep.all).to include "this a created peep"
    end
  end

end
