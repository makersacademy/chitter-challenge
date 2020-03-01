require 'peeps'

  describe Peeps do
   it '#lists peeps' do
       connection = PG.connect(dbname: 'chitter_manager_test')
       Peeps.new_peep("Flounder", "My peep")
       peeps = Peeps.all
       p peeps
       expect(peeps.to_s).to include "Flounder"
       expect(peeps.to_s).to include "My peep"
   end
   # describe '#add a peep' do

    # end
 end 