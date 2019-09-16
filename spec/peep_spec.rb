require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do

      # Add the test data:

      Peep.new_peep('Hello world! First peep!')
      Peep.new_peep('My second peep!')
      Peep.new_peep('Third time lucky!')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first.peep).to eq('Third time lucky!')
      expect(Time.parse(peeps.first.timestamp)).to be_within(1.second).of Time.now
    end
  end

  describe '.new_peep' do
    it 'creates a timestamped peep' do
      peep = Peep.new_peep('I just posted a peep!')
      id = peep.id
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
      expect(peep.id).to eq(result.first['id'])
      expect(peep.peep).to eq('I just posted a peep!')
      expect(peep.timestamp).to eq(result.first['timestamp'])

      # Installed 'activesupport' gem to test the timestamp is current:

      expect(Time.parse(peep.timestamp)).to be_within(1.second).of Time.now
    end
  end
end
