require 'peep'
require 'peep_repository'

describe Peep do
  describe '#find_maker_username' do
    it 'finds the username of a peep for a given maker_id' do
      peep = Peep.new
      peep.maker_id = 1

      expect(peep.find_maker_username).to eq('cute-cat')
    end
  end
end