require 'peep'

describe Peep do

  describe '.display' do
    it 'shows a list of posted peeps' do
      peep_1 = Peep.post(peep: "Can anybody hear me?")
      peep_2 = Peep.post(peep: "Helloooo?")
      expected_peep_1 = peep_1
      expected_peep_2 = peep_2

      expect(Peep.display).to include expected_peep_1, expected_peep_2
    end
  end
end
