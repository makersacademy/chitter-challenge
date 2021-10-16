describe Chitter do
  context 'set up' do
    it 'has a Chitter class' do
      expect(Chitter).to respond_to(:new)
    end
    it 'uses class instance variables' do 
      expect(Chitter).to respond_to(:instance)
      expect(Chitter).to respond_to(:create)
    end
    
  end
end