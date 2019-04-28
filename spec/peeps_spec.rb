require 'peep'

RSpec.describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      peeps = Peep.all

      expect(peeps).to include "Hello, Chitter!"
    end
  end

end
