require 'peeps'
require 'timestamp'

describe Peep do
#   describe '.all' do
#     it 'return all messages' do
#       peeps = Peep.all
#
#       expect(peeps).to include("Hello from Mars!")
#       expect(peeps).to incluce("Welcome to the Moon!")
#       expect(peeps).to include("Go to Earth! Much more fun there!")
#     end
#   end
    describe '.create' do
      it 'create a new peep' do

        peep = Peep.create(peeps: 'Hello from Mars!', timestamp:Inputtime.timestamp)
        id = peep.id
        connection = PG.connect(dbname: 'chitter_test')
        result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
        result.first
        # puts result.first
        expect(peep).to be_a Peep
        expect(peep.id).to eq result.first["id"]
        expect(peep.peeps).to eq 'Hello from Mars!'
        expect(peep.timestamp).to eq Inputtime.timestamp
      end
    end
end
