require 'peep'

describe Peep do
  describe '#create' do
    let(:message) { 'peep peep' }
 
    it 'lets peeps be read' do
      Peep.create(message)
      expect(Peep.all).to include 'peep peep'
    end
  end
end