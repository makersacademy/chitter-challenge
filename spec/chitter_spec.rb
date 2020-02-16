require 'chitter'

describe Chitter do
  it '#lists peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      Chitter.new_peep("Flounder", "My peep")
      chitter = Chitter.all
      p chitter
      expect(chitter.to_s).to include "Flounder"
      expect(chitter.to_s).to include "My peep"
  end
  # describe '#add a peep' do
    
  # end
end