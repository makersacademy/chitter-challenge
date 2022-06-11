require 'chit'

describe Chit do
  describe '.all' do
    it 'should show all posted chits' do
      chits = Chit.all
      expect(chits).to include("My first chit")
      expect(chits).to include("Look ma, I'm chitting!")
    end
  end
end