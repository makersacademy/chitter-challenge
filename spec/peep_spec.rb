require 'peep'

describe Peep do

  let(:peep) { described_class }

  context ".all" do
    it "shows all peeps" do
      peeps = peep.all
      text = peeps.map(&:text)
      expect(text).to include("Hello world!")
      expect(text).to include("Goodbye!")
    end
  end

  context ".create" do
    it "Can create new peeps" do
      peep.create("A new peep!")
      peeps = peep.all
      peep_contents = peeps.map(&:text)
      expect(peep_contents).to include("A new peep!")
    end

  end

end
