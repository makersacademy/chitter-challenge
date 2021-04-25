require 'peep'

describe Peep do
  describe '.create' do
    let(:time) { Time.new }
    let(:hour) { "#{'0' if time.hour < 10}#{time.hour}" }
    let(:min) { "#{'0' if time.min < 10}#{time.min}" }
    let(:sec) { "#{'0' if time.sec < 10}#{time.sec}" }
    let(:time_string) { "#{hour}:#{min}:#{sec}" }

    it 'creates a new peep' do
      described_class.create('a message')

      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec('SELECT * FROM peep;')
      expect(result[0]['message']).to eq('a message')
      expect(result[0]['time']).to eq(time_string)
    end

    it "stores a new peep's time" do
      described_class.create('a message')

      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec('SELECT * FROM peep;')
      expect(result[0]['time']).to eq(time_string)
    end
  end

  describe '.list' do
    it 'returns a list of 1 peep' do
      connection = PG.connect(dbname: 'chitter_test')
      rows = 'time, message'
      values = "'00:01:02','a great peep'"
      connection.exec("INSERT INTO peep (#{rows}) VALUES (#{values});")

      expect(described_class.list[0].message).to eq('a great peep')
      expect(described_class.list[0].time).to eq('00:01:02')
    end
  end
end
