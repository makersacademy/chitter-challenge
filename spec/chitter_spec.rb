require 'chitter'
require 'peep'

describe Chitter do

  let(:time_1) { '2018-10-26 08:32:54' }
  let(:time_2) { '2018-10-26 10:32:54' }
  let(:peep_1) { "Hi from chitter" }
  let(:peep_2) { "Hi there" }

  describe '::all' do
    it 'shows a peep content and time' do
      Peep.create(peep_1, time_1)
      chitter = Chitter.all(Peep)
      expect(chitter.first.content).to eq peep_1
      expect(chitter.first.time).to eq time_1
    end

    it 'shows all peeps content and time in reverse chronological order' do
      Peep.create(peep_1, time_1)
      Peep.create(peep_2, time_2)
      chitter = Chitter.all(Peep)
      expect(chitter.last.content).to eq peep_1
      expect(chitter.last.time).to eq time_1
      expect(chitter.first.content).to eq peep_2
      expect(chitter.first.time).to eq time_2
    end
  end
end
