require "./lib/chitter"

describe Chitter do
  describe "#all" do
    it "Returns all a chitter object, which we can extract a name instance from" do
      array = Chitter.all
      chitter_object = array[0]
      expect(chitter_object.message).to eq("Test 1")
    end
  end
end
