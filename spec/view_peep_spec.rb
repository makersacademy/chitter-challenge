require 'peep'

describe Peep do

  describe '.display' do
    it 'a user can see a list of posted peeps' do
      firstpeep = Peep.post(peep: "my name is Lucy")
      secondpeep = Peep.post(peep: "my surname is Gore")

      expected_peeps = [
        firstpeep,
        secondpeep
      ]

      expect(Peep.showpeeps).to include firstpeep
    end
  end
end
