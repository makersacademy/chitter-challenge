require './lib/message'

describe Message do

  describe '.all' do
    it 'show all message have been posted on chitter' do
      peeps = Message.all
      peep = peeps.map(&:messages)
      expect(peep).to include('some text')
    end
  end
end
