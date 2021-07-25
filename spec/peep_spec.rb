require 'peep'
require 'time'
require 'timecop'

describe Peep do
  describe '.all' do
    it 'contains all the peeps' do
    Peep.add('one')
    Peep.add('two')
    Peep.add('three')
    peeps = Peep.all
      expect(peeps.first.peep).to include 'one'
      expect(peeps.last.peep).to include 'three'
      expect(peeps.length).to eq 3
    end
    it 'has adds the time' do
      time = Timecop.freeze
      clock = time.strftime("%k:%M") 
      date = time.strftime("%d/%m")
      peep = Peep.add('peep')
      first = Peep.all.first
      expect(first.time).to include(clock)
      expect(first.time).to include(date)
    end
  end

  describe '.add' do
    it 'adds a peep' do
      peep = Peep.add('Adding a peep')
      expect(peep).to be_a Peep
      expect(peep.peep).to eq 'Adding a peep'
      # expect(peep.time).to be_within(30.seconds).of(Time.now)
    end
  end
  end


  