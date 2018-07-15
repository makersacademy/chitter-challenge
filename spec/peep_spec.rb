require 'peep'

describe Peep do
  before(:each) do
    @peep = Peep.save(peep: 'Test peep')
  end

  describe '.save' do
    it 'saves a peep to the database' do
      expect { Peep.save(peep: 'another peep') }.to change { Peep.all.count }.by 1
      #expect(@peep.id).not_to be_nil
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all.map(&:peep)
      expect(peeps).to include("Test peep")
    end
  end

end
