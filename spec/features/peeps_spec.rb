require './lib/peeps'

describe Peeps do
  describe ".all" do
    it "shows all peeps on the homepage" do
      expect(Peeps.all).to include("this is my first peep")
    end
  end
end
