require 'chitter'
require 'peep'

describe Chitter do

  let(:time) { '2018-10-26 08:32:54' }
  let(:peep_1) { "Hi from chitter" }
  let(:peep_2) { "Hi there" }

  describe '::all' do
    it 'shows a peep content and time' do
      Peep.create(peep_1, time)
      chitter = Chitter.all(Peep)
      expect(chitter.first.content).to eq peep_1
      expect(chitter.first.time).to eq time
    end

    it 'shows all peeps content and time' do
      Peep.create(peep_1, time)
      Peep.create(peep_2, time)
      chitter = Chitter.all(Peep)
      expect(chitter.first.content).to eq peep_1
      expect(chitter.first.time).to eq time
      expect(chitter.last.content).to eq peep_2
      expect(chitter.last.time).to eq time
    end
  end
end
