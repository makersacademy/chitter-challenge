require 'peep'

describe Peep do
  describe '#self.all' do
    it 'returns a list of all peeps' do
      Peep.post('This is a test peep!')
      Peep.post('This is also a test peep!')
      Peep.post('This is another test peep!')
      peeps = Peep.all
      expect(peeps.length).to eq 3
    end
  end

  describe '#self.post' do
    it 'creates a new peep' do
      Peep.post("This is another test peep!")
      expect(Peep.all[0].message).to eq 'This is another test peep!'
    end

    it 'shows the time of the peep' do
      peep = Peep.post("This is a test peep!")
      expect(peep[0].time).to eq Time.now.strftime("%H:%M:%S")
    end
  end
end
