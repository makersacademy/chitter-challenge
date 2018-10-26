require "peep"

describe Peep do
  describe '::create' do
    let(:content) { "Hi there" }
    let(:time) { '2018-10-26 08:32:54' }
    let(:peep) { Peep.create(content, time) }

    it 'creates a new peep with content and time' do
      expect(peep.first['content']).to eq content
      expect(peep.first['time']).to eq time
    end
  end
end
