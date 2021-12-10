require 'message'

describe Message do
  describe '#add' do
    it 'should add a chitter post' do
      expect(Message.add('My first message')).to eq 'My first message'
    end
  end
end