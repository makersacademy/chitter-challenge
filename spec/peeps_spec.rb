require 'peeps'

describe Peeps do

  describe '#create' do
    it 'creates a new peep' do
      Peeps.create(peep: 'hello, world')
      expect(Peeps.all).to include 'hello, world'
    end
  end

end
