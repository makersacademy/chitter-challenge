require 'chitter'
require 'pg'

describe Chitter do
  describe '.all' do
    it 'returns a list of messages' do
      connection = PG.connect(dbname: 'Twitter_clone_test')

#  Add the test data
      chitter = Chitter.create(message: "Test")
      Chitter.create(message: "Testing testing 1 2 1 2")
      Chitter.create(message: "Exam")

      chitter = Chitter.all

      expect(chitter.length).to eq 3
      expect(chitter.first).to be_a Chitter
  #    expect(chitter.first.id).to eq chitter.id
      expect(chitter.first.message).to eq 'Exam'
    end
  end
end
