require 'peep'

describe Peep do

  describe 'creation of a new peep' do

    it 'contains a message body' do
      message = "I'm a peep message body"
      peep = Peep.create(message: message)
      expect(peep.message).to eq message
    end

    it 'knows when it was created' do
      message = "I'm a peep message body"
      time = "#{Time.now.hour}" + ":" + "#{Time.now.min}"
      peep = Peep.create(message: message)
      expect(peep.created_at.to_s).to include(time)
    end
  end



end