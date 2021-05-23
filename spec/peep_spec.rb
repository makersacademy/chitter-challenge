=begin 
require 'peep'

describe Peep do
  describe '.all' do 
    it 'returns a list of all peeps' do
      peeps = Peep.all
      expect(peeps).to have_content "WOW, my first peep!"
    end
  end
end
=end