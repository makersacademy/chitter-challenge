require 'pg'
require 'peep'

describe Peep do
  describe '#create' do
    it 'adds a new Peep to the homepage' do
      peep = Peep.create('Looking forward to dinner')
      expect(peep).to be_an_instance_of Peep
    end
  end
end
