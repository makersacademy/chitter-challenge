describe Message do
  context 'set up' do
    it 'has a Message class' do
      expect(Message).to respond_to(:new)
    end
  end

  context '#all' do
    it 'returns all messages' do
      expect(Message).to respond_to(:new)
    end
  end

end