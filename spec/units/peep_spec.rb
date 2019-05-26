require 'peep'
require 'database_helpers'
require 'time_helpers'

describe Peep do
  let(:time_now) { Time.parse(Time.now.strftime("%Y-%m-%d %H:%M:%S :z")) }

  describe '#new' do
    it 'creates a peep with id, message and time' do
      peep = Peep.new(id: 1, message: "New peep", sent_time: time_now)

      expect(peep.id).to eq(1)
      expect(peep.message).to eq("New peep")
      expect(peep.sent_time).to eq(time_now)
    end
  end

  describe '#!=' do
    it 'returns true if two peeps are different' do
      first_peep = Peep.new(id: 1, message: "New peep", sent_time: time_now)
      second_peep = Peep.new(id: 2, message: "New peep", sent_time: time_now)

      expect(first_peep != second_peep).to eq(true)
    end

    it 'returns false if two peeps are the same' do
      first_peep = Peep.new(id: 1, message: "New peep", sent_time: time_now)
      second_peep = Peep.new(id: 1, message: "New peep", sent_time: time_now)

      expect(first_peep != second_peep).to eq(false)
    end
  end

  describe '.send' do
    it 'sends a new peep' do
      stub_time(time_now)
      peep = Peep.send(message: "Hello there")
      persisted_data = persisted_data(table: :peeps, id: peep.id)

      expect(peep).to be_a(Peep)
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq("Hello there")
      expect(peep.sent_time).to eq(time_now)
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      stub_time(time_now - 120)
      first_peep = Peep.send(message: "First peep")

      stub_time(time_now - 60)
      second_peep = Peep.send(message: "Second peep")

      stub_time(time_now)
      third_peep = Peep.send(message: "Third peep")

      expect(Peep.all).to eq([third_peep, second_peep, first_peep])
    end
  end
end
