describe Peep do

  describe '#show_all' do
    it 'expect show all to return array of Peeps' do
      peeps = Peep.show_all
      expect(peeps).to be_a(Array)
      expect(peeps).to include(Peep)
    end
  end

end
