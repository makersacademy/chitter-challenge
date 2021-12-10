require 'message'

describe Message do

  describe '.view' do
    it 'should return a message' do
      expect(Message.view).to eq 'My first message'
    end
  end

  describe '.add' do
    it 'should add a chitter post' do
      result = Message.add('My first message')
      expect(result).to eq 'My first message'
    end
  end
end