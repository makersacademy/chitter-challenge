require 'chitter'

describe Chitter do
  it 'Has a create method' do
    expect(Chitter).to respond_to(:create)
  end

  describe 'view' do
    it 'should output context from db to apply to view' do
      Chitter.create('This is my first peep')
      Chitter.create('tis but a peep')
      Chitter.create('no body expects the spanish inquisition')

      chitter = Chitter.view
      expect(chitter.length).to eq(3)
      expect(chitter.first).to be_instance_of(Chitter)
      expect(chitter.first.context).to eq('This is my first peep')
    end
  end
end
