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

    it "New peeps are timestamped" do
      peep.create("A new peep!")
      peeps = peep.all
      peep_time = peeps.map(&:time)
      time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
      expect(peep_time).to include(time)
    end

  end

end
