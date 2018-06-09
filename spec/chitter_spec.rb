require 'chitter'

describe Peep do
  before(:each) do
    @peep = Peep.save(peep: 'Test peep')
  end

  describe '.save' do
    it 'saves a peep to the database' do
      expect(@peep.id).not_to be_nil
    end
  end

end
