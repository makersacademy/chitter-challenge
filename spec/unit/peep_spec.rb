require './lib/peep'

describe Peep do 
  describe '.all' do 
    it 'returns all peep records in time' do 
      
      time = Time.new(2002, 02, 02)

      Peep.create(text: 'This is a test peep', time: Time.new(2020,02,02))
      second_peep = Peep.create(text: 'This is a second test', time: Time.new(2020,03,03))

      peep_all = Peep.all

      expect(peep_all.length).to eq(2)
      expect(peep_all.first).to be_a Peep
      expect(peep_all.first.id).to eq second_peep.id
      expect(peep_all.first.text).to eq "This is a second test"
    end 
  end 

  describe '.create' do 
    it 'creates a new peep post' do 
      time = Time.new(2002, 02, 02)
      
      peep = Peep.create(text: 'This is a new test peep', time: time)

      peep_all = Peep.all

      expect(peep).to be_a Peep
      expect(peep_all.first.id).to eq peep.id
      expect(peep.text).to include 'This is a new test peep'
      expect(peep.time).to include '2002-02-02'
    end 
  end 
end 
