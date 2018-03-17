require 'peep'

describe Peep do

  let(:mock_connection) {
    double :DatabaseConnection,
    query:
    [
      { id: 1,
        text: 'I am a peep',
        time: Time.mktime(0).strftime("%Y-%D-%H:%M:%S")
      }
    ]
  }

  before :each do
    Peep.setup(mock_connection)
  end

  describe '#self.all' do
    it 'messages the database to retrieve all peeps' do
      expect(mock_connection).to receive(:query).with('SELECT * FROM peeps')
      described_class.all
    end
    it 'wraps the results from the database as an array of peep objects' do
      expect(described_class.all[0]).to be_an_instance_of(described_class)
    end
  end
end
