require 'peep.rb'

describe Peep do
  # subject(:peep) { described_class.new }
  context '#message' do
    it 'returns messages' do
      test_connection = PG.connect(dbname: 'chitter_test')

      #Adding the test data
      test_connection.exec("INSERT INTO messages (url) VALUES ('Your New Peep is now life!');")

      peep =  Peep.message

      expect(peep).to include "Your New Peep is now life!"
    end
  end
end
