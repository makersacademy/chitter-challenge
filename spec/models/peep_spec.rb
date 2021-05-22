require 'peep'

describe Peep do
  describe '::all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include('test peep 1')
      expect(peeps).to include('test peep 2')
      expect(peeps).to include('test peep 3')
    end
  end
end