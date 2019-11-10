# require 'peep'
#
# describe Peep do
#   subject(:peep) { described_class.new }
#   describe '.all' do
#     it 'returns a list of all peeps' do
#       connection = PG.connect(dbname: 'chitter_test')
#       peep = Peep.add(peep: 'This is peep 1'),
#       Peep.add(peep: 'This is peep 2'),
#       Peep.add(peep: 'This is peep 3')
#       peeps = Peep.all
#       expect(peeps).to include "This is peep 1"
#       expect(peeps).to include "This is peep 2"
#       expect(peeps).to include "This is peep 3"
#       expect(peeps.length).to eq 3
#     end
#   end
#
#   describe '.add' do
#     it 'adds a new peep' do
#       connection = PG.connect(dbname: 'chitter_test')
#       Peep.add(peep: 'This is a new peep')
#       expect(Peep.all).to include "This is a new peep"
#     end
#   end
# end
