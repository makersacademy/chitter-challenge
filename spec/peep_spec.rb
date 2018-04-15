require 'peep'

describe Peep do
  before(:each) do
    @peep = Peep.add({:content => 'blach'})
  end

  describe 'Database functions' do
    describe '.list' do
      it 'returns all peeps, wrapped in a Peep instance' do
        peeps = Peep.list

        contents = peeps.map(&:content)

        expect(contents).to include("blach")
      end
    end

    describe '.add' do
      it 'add a new peep' do
        expect(@peep.id).not_to be_nil
      end
    end
  end
end
