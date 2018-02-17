require 'peep'

describe Peep do

  context ".all" do
    it "shows all peeps" do
      peeps = Peep.all
      text = peeps.map(&:text)
      expect(text).to include("Hello world")
      expect(text).to include("Goodbye!")
    end
  end
end
