require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include("Hi, im tired!")
      expect(peeps).to include("Hi, life has bein good!")
    end
  end
end