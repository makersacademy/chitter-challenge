require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("My first peep!")
      expect(peeps).to include("Hello, World")
      expect(peeps).to include("Let me tell you something about Chitter..")
    end
  end
end
