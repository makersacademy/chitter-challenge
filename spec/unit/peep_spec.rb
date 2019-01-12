require 'peep'

describe Peep do
  let!(:peep) { Peep.create(text: 'Test peep', created_at: '2000-01-01 00:00:00') }

  describe '#format_time' do
    it 'formats the time' do
      expect(peep.format_time).to eq '01-01-00 00:00:00'
    end
  end
end
