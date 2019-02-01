describe Peep do
  describe '#create' do
    it 'can be created with a content paramater' do
      my_peep = Peep.create(content: 'Hello world')
      expect(my_peep.content).to eq "Hello world"
    end
  end
  
  describe '#all' do
    it 'returns all Peeps' do
      my_peep = Peep.create(content: 'Hello Tom')
      expect(Peep.all).to eq [my_peep]
    end
  end
end
