require 'peep'

describe Peep do
  describe ".all" do
    it 'should return all peeps in reverse order' do
      peep_1 = Peep.create(posts_a_peep: "first message")
      peep_2 = Peep.create(posts_a_peep: "second message")
      peep_3 = Peep.create(posts_a_peep: "third message")

      expected_peeps = [ peep_3, peep_2, peep_1]

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
