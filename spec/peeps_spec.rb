require 'peeps'

describe Peeps do

  # subject(:peeps) { described_class.new }

  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include("I had a great day")
      expect(peeps).to include("I feel sad")
    end
  end
end