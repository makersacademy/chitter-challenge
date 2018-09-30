require 'peep'

describe Peep do
  context ".create" do
    it "should store peep in database" do
      Peep.create(text: "Test Peep")
      expect(Peep.get(1).text).to eq "Test Peep"
    end
  end
end
