require 'peep'

describe Peep do

  describe '::all' do
    it 'displays all peeps' do
      expect(Peep.all).to include "This is a test peep"
    end
  end

end
