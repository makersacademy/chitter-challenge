require 'peep'

describe Peep do
  describe ".create" do
    it 'creates a new peep and returns peep instance' do
      now = Time.new(2020)
      allow(Time).to receive(:now) { now }

      peep = Peep.create('Hello, world!')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep.id).to eq persisted_data[0]['id']
      expect(peep.body).to eq 'Hello, world!'
      expect(peep.time_date).to eq ' 0:00 1 Jan 20'
    end
  end

  describe ".find" do
    it 'returns the peep corresponding to a given peep id' do
      peep = Peep.create('My first peep!')

      expect(described_class.find(peep.id).id).to eq peep.id
      expect(described_class.find(peep.id).body).to eq peep.body
      expect(described_class.find(peep.id).time_date).to eq peep.time_date
    end
  end
end
