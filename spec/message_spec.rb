require 'message'

describe Message do

  describe '.view_all' do
    it 'should return a message' do
      Message.add('My first message')
      Message.add('My second message')
      expect(Message.view_all[1].message).to include 'My first message'
      expect(Message.view_all[0].message).to include 'My second message'
    end
  end

  describe '.add' do
    it 'should add a chitter post' do
      Message.add('My first message')
      expect(Message.view_all[0].message).to include 'My first message'
    end
  end
end
