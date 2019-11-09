require 'peep'

describe Peep do

  describe "creating peeps" do

    it "can create a peep" do
      peep = Peep.create(text: 'My first peep')
      expect(peep).to be_a Peep
      expect(peep.id).to eq peep.id
      expect(peep.text).to eq 'My first peep'

    end
  end

end
