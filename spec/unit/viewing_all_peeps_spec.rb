require 'spec_helper'
require 'peep'

describe Peep do
  describe '.all' do
    it "returns all peeps" do
      peeps = Peep.all 

      expect(peeps).to include("Message 1")
      expect(peeps).to include("Message 2")
      expect(peeps).to include("Message 3")
    end
  end
end