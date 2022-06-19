require 'peep'
RSpec.describe Peep do
  describe Peep do
    describe '.all' do
      it 'returns all peeps' do
        Peep.create("This is my first peep")
        expect(Peep.all).to include ("This is my first peep")
      end
    end

    describe '.create' do
      it 'creates a new peep' do
        Peep.create(content: 'This is a test')
        expect(Peep.all).to include 'This is a test'
      end
    end
  end

end
