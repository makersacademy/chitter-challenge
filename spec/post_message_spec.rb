require 'peep'

describe Peep do

  describe '.post' do
    it 'a user can post a peep to Chitter' do
      peep_1 = Peep.post(peep: "This is my first peep")

      expect(Peep.display).to include peep_1
    end
  end
end
