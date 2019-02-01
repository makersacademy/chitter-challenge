require 'peep'

describe Peep do

  describe 'creation of a new peep' do

    it 'should contain a message body' do
      message = "I'm a peep message body"
      peep = Peep.create(body: message)
      expect(peep.message).to eq message
    end
  end

end