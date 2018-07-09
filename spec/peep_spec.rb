require 'peep'

describe Peep do
  describe '.add' do
    it 'add message' do
      peep =  Peep.add('jeff123', 'jeff', 'My first peep')
      expect(Peep.all).to include peep
    end
  end

  # describe '.all' do
  #   it 'see user all message' do
  #     peep_1 = Peep.add('jeff123', 'jeff', 'My first peep')
  #     peep_2 = Peep.add('jeff123', 'jeff', 'My second peep')
  #     peep_3 = Peep.add('jay123', 'jay', 'My first peep')
  #     peep = Peep.all
  #
  #     expected_comments = [
  #       peep_1,
  #       peep_2
  #     ]
  #
  #     expect(Peep.add).to include expected_comment
  #   end
  # end
end
