require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include("Hello Chitter!")
      expect(peeps).to include("Monday again :(")
    end
  end
end
