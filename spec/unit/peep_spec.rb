require 'peep'

describe Peep do

  before do
    Timecop.freeze
  end

  after do
    Timecop.return
  end

  let!(:peep) { described_class.create(
                :content => 'Test peep',
                :created_at => Time.now) }

  describe '#content' do
    it 'returns the peep content' do
      expect(peep.content).to eq 'Test peep'
    end
  end

  describe '#time' do
    it 'returns the timestamp' do
      expect(peep.time).to eq Time.now.strftime("%H:%M:%S - %d/%m/%y")
    end
  end
end
