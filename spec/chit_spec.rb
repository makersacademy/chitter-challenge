require 'chit'

describe Chit do
  describe '.all' do
    it 'should show all posted chits' do
      chits = Chit.all
      expect(chits).to include "Hey my first chit"
      expect(chits).to include "Look pops, I am chitting"
      expect(chits).to include "Wassup!"
    end
  end
end