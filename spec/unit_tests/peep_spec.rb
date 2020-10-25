require_relative '../../models/peep'

describe Peep do

  describe '.all' do 
    it 'returns a list of peeps' do
      add_peeps

      peep_1 = Peep.all.first
      peep_2 = Peep.all[1]
      peep_3 = Peep.all[-1]

      expect(peep_1.message).to eq 'This is my first peep!'
      expect(peep_1.creator).to eq 'USER_1'
      expect(peep_2.message).to eq 'This is my second peep!'
      expect(peep_2.creator).to eq 'USER_2'
      expect(peep_3.message).to eq 'This is my third peep!'
      expect(peep_3.creator).to eq 'USER_3'
    end
  end

  describe '.list_ordered_peeps' do 
    it 'returns peeps in reverse chronological order' do
      add_peeps

      peep_1 = Peep.list_ordered_peeps.first
      peep_2 = Peep.list_ordered_peeps[1]
      peep_3 = Peep.list_ordered_peeps[-1]

      expect(peep_1.message).to eq 'This is my third peep!'
      expect(peep_1.creator).to eq 'USER_3'
      expect(peep_2.message).to eq 'This is my second peep!'
      expect(peep_2.creator).to eq 'USER_2'
      expect(peep_3.message).to eq 'This is my first peep!'
      expect(peep_3.creator).to eq 'USER_1'
    end
  end
end