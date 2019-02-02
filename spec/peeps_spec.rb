require 'peeps.rb'

describe Peeps do
  describe '.all' do
    it 'Shows a list of peeps' do
      peeps = Peeps.all
      expect(peeps).to include('First peep woo')
    end
  end
end
