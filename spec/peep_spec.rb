require 'peep'

RSpec.describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      peeps = Peep.all

      expect(peeps).to include('Hi, I am peep three')
      expect(peeps).to include('Hi, I am peep two')
      expect(peeps).to include('Hi, I am peep one')
    end
  end
end
