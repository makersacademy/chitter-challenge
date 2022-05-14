require 'peeps.rb'

describe 'messages' do
  describe '.all' do
    it 'returns list of peeps' do
      peeps = Peeps.all

      expect(peeps).to include("Kendrick (@KLamar): New album coming soon :D")
      expect(peeps).to include("Cristiano Ronaldo (@Ronaldo): Messi is better tbh.")
    end
  end
end