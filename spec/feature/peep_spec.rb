require 'peep'
require 'time'
require 'pry'

describe Peep do
  describe 'add' do
    it 'adds a new peep' do
      # binding.pry
      peep = Peep.add(peep: 'This is my first ever peep.')
      expect(peep.peep).to eq 'This is my first ever peep.'
    end
  end

  it 'tells the time of the peep' do
    peep = Peep.add(peep: 'This is my first ever peep')
    expect(peep.time).to eq Time.now.strftime("%I:%M on %d %B, %Y").to_s
  end
end
