require 'chitter'

describe Chitter do

  describe '.new_message' do
    it 'Creates a peep' do
      chitter = Chitter.new_message(peep: 'Once upon a time')

      expect(chitter.peep).to eq 'Once upon a time'
    end
  end
end
