require 'message'

describe Message do

  describe '.create' do  
    it 'creates a new peep' do
      Message.create(text: 'A peep')

      expect(Message.all).to include 'A peep'
    end
  end

  describe '.all' do
    it 'displays all peeps' do

      Message.create(text: 'Peepin aint easy')
      Message.create(text: 'Look before you peep')
      Message.create(text: 'Im a peep')

      peeps = Message.all

      expect(peeps).to include("Peepin aint easy")
      expect(peeps).to include("Look before you peep")
      expect(peeps).to include("Im a peep")
    end
  end
end
