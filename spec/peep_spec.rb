require 'peep'

describe Peep do
  describe '.all' do
    it 'Shows a litst of different peeps' do
      peep = Peep.all
      expect(peep).to include "Hello Makers"
      expect(peep).to include "This weekend challenege is fun"
    end
  end
end