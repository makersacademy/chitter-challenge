describe Message do
  context 'set up' do
    it 'has a Message class' do
      expect(Message).to respond_to(:new)
    end
    it 'uses class instance variables' do 
      expect(Message).to respond_to(:instance)
      expect(Message).to respond_to(:create)
    end

  end
end