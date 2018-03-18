require 'peep'

describe Peep do

  describe '.all' do
    it 'shows all the peeps' do
      peeps = Peep.all
      expect(peeps).to include("Hello Chitter!")
      expect(peeps).to include("My first chitter")
    end
  end

end
