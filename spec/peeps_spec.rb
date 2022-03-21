require 'peeps'

describe Peeps do
  describe "#all" do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include("Hi rio do u want picking up in the morning pal")
      expect(peeps).to include("Mr bean. Funny")
    end
  end
end
