describe Peep do
  describe '#all' do
    it 'returns an array of peeps' do
      expect(Peep.all).to all(be_an_instance_of(Peep))
    end
  end
end
