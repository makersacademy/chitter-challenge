require 'peep'

describe Peep do

  let(:mock_connection) {
    double :DatabaseConnection,
    query:
    [
      { 'id' => 1,
        'text' => 'I am peep 1',
        'time' => Time.mktime(0).strftime("%Y-%D-%H:%M:%S") },
      { 'id' => 3,
        'text' => 'I am peep 3',
        'time' => Time.mktime(2).strftime("%Y-%D-%H:%M:%S") },
      { 'id' => 2,
        'text' => 'I am peep 2',
        'time' => Time.mktime(1).strftime("%Y-%D-%H:%M:%S") }
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
    it 'sorts the returned array by time' do
      peep_array = described_class.all
      expect(peep_array.map { |peep| peep.id }).to eq [3, 2, 1]
    end
  end

  describe '#self.add' do
    it 'messages the database to add a peep' do
      text = 'I am a new peep'
      allow(Time).to receive(:now).and_return(Time.mktime(0))
      timestring = Time.now.strftime("%Y-%D-%H:%M:%S")
      expect(mock_connection).to receive(:query).\
      with("INSERT INTO peeps (text, time) VALUES ('#{text}', '#{timestring}')")
      Peep.add(text)
    end
  end
end
