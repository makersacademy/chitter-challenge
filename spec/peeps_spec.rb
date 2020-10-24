require 'peeps'

describe Peeps do

  # subject(:peeps) { described_class.new }

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')

      connection.exec("INSERT INTO peeps (message_content) VALUES ('I had a great day');")
      connection.exec("INSERT INTO peeps (message_content) VALUES ('I feel sad');")

      peeps = Peeps.all

      expect(peeps).to include("I had a great day")
      expect(peeps).to include("I feel sad")
    end
  end
end