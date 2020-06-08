require 'peep'
require 'date'
require 'timecop'

describe Peep do
  
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(title: "Hello", peep: "Feeling good")
      Peep.create(title: "Go away", peep: "Feeling bad")
      Peep.create(title: "Coding", peep: "Feeling lost")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.title).to eq "Hello"
      expect(peeps.first.peep).to eq "Feeling good"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      new_peep = Peep.create(title: "Morning", peep: "Hi")

      expect(new_peep.title).to eq "Morning"
      expect(new_peep.peep).to eq "Hi"
    end
  end

  describe '.all' do
    it 'includes a time stamp of when peep was created' do
      Timecop.freeze(Date.parse('07 June 2020'))
      peep = Peep.create(title: "Hello", peep: "Feeling good")

      expect(peep.time).to eq('2020-06-07 00:00:00')
    end
  end

end