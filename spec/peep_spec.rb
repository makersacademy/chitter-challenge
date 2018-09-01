require 'peep'

describe Chitter do
  describe ".create_new_peep" do
    it "creates a new peep" do
      sample_peep = 'This is a sample peep with my latest and greatest thought'
      peep = Peep.create_new_peep(sample_peep)
      expect(peep).to eq 'This is a sample peep with my latest and greatest thought'
    end
  end
end
