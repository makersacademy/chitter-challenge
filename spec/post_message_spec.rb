require 'peep'

describe Peep do

  describe '.display' do
    it 'shows a list of posted peeps' do
      Peep.post(peep: "Can anybody hear me?")
      Peep.post(peep: "Helloooo?")
      expected_peep_1 = 'Can anybody hear me?'
      expected_peep_2 = 'Helloooo?'

      expect(Peep.display).to include expected_peep_1, expected_peep_2
    end
  end

  describe '.post' do
    it 'a user can post a peep to Chitter' do
      Peep.post(peep: "This is my first peep")

      expect(Peep.display).to include "This is my first peep"
    end
  end
end
