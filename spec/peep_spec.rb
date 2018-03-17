require 'peep'

describe Peep do

  let(:mock_connection) { double :DatabaseConnection,
  query: nil }

  before :each do
    Peep.setup(mock_connection)
  end

  describe '#self.all' do
    it 'messages the database to retrieve all peeps' do
      expect(mock_connection).to receive(:query).with('SELECT * FROM peeps')
      described_class.all
    end
  end
end
