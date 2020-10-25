describe Peep do
  describe '.list' do
    it 'lists all peeps in database' do
      peeps = Peep.list
      expect(peeps[0][:message]).to eq("my first peep")
    end
  end
end
