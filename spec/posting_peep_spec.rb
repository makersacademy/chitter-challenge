require 'peep'

describe Peep do

  describe '.post' do
    it 'a user can post a peep to Chitter' do
      peep = Peep.post(peep: "this is my first peep")

      expect(Peep.showpeeps).to include peep
    end
  end
end
