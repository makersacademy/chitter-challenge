require 'db_connection'

describe DBConnection do
  let(:peep) { double(:peep, :content => 'this is a test peep', :date => '1991-01-08', :time => '04:05:00') }
  describe '.setup' do
    it 'returns database connection as class instance variable' do
      testdb = 'chitter_test'
      described_class.setup(testdb)
      expect(DBConnection.db).to be_a PG::Connection
    end
  end
  describe '.query' do
    it 'executes an SQL query on the appropriate database' do
      testdb = 'chitter_test'
      described_class.setup(testdb)
      described_class.query("INSERT INTO peeps (content, date, time) VALUES('#{peep.content}', '#{peep.date}', '#{peep.time}') RETURNING id, content, date, time;")
      result = described_class.query("SELECT * FROM peeps WHERE content = '#{peep.content}';")
      expect(result[0]['date']).to eq(peep.date)
      expect(result[0]['time']).to eq(peep.time)
    end

  end
end
