require 'peep'

describe Peep do
  describe '.create' do
    it 'adds a peep' do
      peep_message = "Im adding a peep"
      Peep.create(username: "Gareth", message: peep_message)

      peeps = Peep.all

      expect(peeps.first.message).to eq peep_message
    end
  end
end
