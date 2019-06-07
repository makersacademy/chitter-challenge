require 'peep'
require_relative '../../data_mapper_setup.rb'

describe Peep do
  before(:each) do
    Peep.destroy
    create_peeps
  end
  let(:time) { Time.now }
  let(:peep) { Peep.new(id: 1, text: 'Test peep', created_at: time) }
  describe '.all' do
    it 'returns an array of peeps' do
      expect(Peep.all).to satisfy { |array| array.all?(Peep) }
    end

    it 'returns peeps with the test text' do
      expect(Peep.all[0].text).to eq('First ever peep!!!!')
    end

    it 'returns peeps with the test time' do
      now = Time.now
      string = now.strftime('%Y%m%d%H%I%M')
      Peep.create(text: "Testing time", created_at: now)
      expect(Peep.all.last.created_at.to_time.strftime('%Y%m%d%H%I%M')).to eq(string)
    end
  end

  describe '#format_created_at' do
    it 'returns a formatted date and time' do
      expected = time.strftime("#{time.day.ordinalize} of %B, %Y at %l:%M%P")
      expect(peep.format_created_at).to eq(expected)
    end
  end
end
