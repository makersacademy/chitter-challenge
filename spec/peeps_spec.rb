require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include 'Hello chitter users'
      expect(peeps).to include 'This is my first peep'
    end
  end
end
