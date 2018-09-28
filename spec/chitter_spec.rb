require 'chitter'

# describe Chitter do
#   describe '.all' do
#     it 'returns all chits' do
#       conn = PG.connect( dbname: 'chits_test')
#
#       conn.exec("INSERT INTO chits (msg) VALUES ('hello everyone');")
#       conn.exec("INSERT INTO chits (msg) VALUES ('this is a first chit');")
#       conn.exec("INSERT INTO chits (msg) VALUES ('this is a second!!!');")
#
#       chitter = Chitter.all
#
#       expect(chits).to include('hello everyone')
#       expect(chits).to include('this is a first chit')
#       expect(chits).to include('this is a second!!!')
#     end
#   end
# end
