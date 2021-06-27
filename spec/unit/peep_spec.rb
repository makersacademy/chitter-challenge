# require 'peep'

# describe Peep do
#   describe '.all' do
#     it 'returns all peeps in reverse chronological order' do
#       connection = PG.connect(dbname: 'chitter_test')
      
#       connection.exec("INSERT INTO peeps (peep) VALUES("Hello weekend!");")
#       connection.exec("INSERT INTO peeps (peep) VALUES("I love Chitter!");")
#       connection.exec("INSERT INTO peeps (peep) VALUES("Good Bye COVID-19!");")
      
#       peeps = Peep.all

#       expect(peeps).to include("Hello weekend!")
#       expect(peeps).to include("I love Chitter!")
#       expect(peeps).to include("Good Bye COVID-19!")
#     end
#   end
# end
