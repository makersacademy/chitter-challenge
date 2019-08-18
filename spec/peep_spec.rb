describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      DatabaseConnection.query("INSERT into peeps (message) VALUES('peep1');")
      DatabaseConnection.query("INSERT into peeps (message) VALUES('peep2');")
  
      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'peep2'
    end
  end
end