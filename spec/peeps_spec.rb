require 'peeps'

describe Peeps do

   describe '.all' do
     it 'returns all peeps/messages' do
       connection = PG.connect(dbname: 'chitter_test')

       connection.exec("INSERT INTO peeps_timeline (peep) VALUES ('Tired');")
       connection.exec("INSERT INTO peeps_timeline (peep) VALUES ('Hungry');")
       connection.exec("INSERT INTO peeps_timeline (peep) VALUES ('lonely');")

       timeline = Peeps.all

       expect(timeline).to include("Tired")
       expect(timeline).to include("Hungry")
       expect(timeline).to include ("lonely")
       end
     end
   end
