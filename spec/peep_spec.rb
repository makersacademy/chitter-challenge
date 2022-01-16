require 'peep'

describe Peep do
  describe '#create' do
    let(:message) { 'peep peep' }
 
    it 'lets peeps be made and read' do
      Peep.create(message)
      expect(Peep.all).to include 'peep peep'
    end

    it 'peeps are read in reverse order' do
      Peep.create('one')
      Peep.create('two')
      Peep.create('three')
      expect(Peep.all).to include('three', 'two', 'one')
    end
  end
end