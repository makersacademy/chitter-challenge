require 'peep'

describe Peep do
  context ".create" do
    it "should store peep in database" do
      peep = Peep.create(text: "Test Peep")
      expect(peep.text).to eq "Test Peep"
    end
  end
end
