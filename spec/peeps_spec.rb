require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all
      expect(peeps).to include 'Wow it was hot yesterday...'
    end
  end
end
