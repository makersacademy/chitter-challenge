require 'peeps'

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
        Peep.create(peeps: 'Hello from Mars!', timestamp: Time.now)

        expect(Peep.all).to include 'Hello from Mars!'
      end
    end
end
