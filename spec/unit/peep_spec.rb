require './lib/peep'

describe Peep do 
  describe '.all' do 
    it 'returns all peep records in time' do 
      
      time = Time.new(2002, 02, 02)

      Peep.create(text: 'This is a test peep', time: time )
      Peep.create(text: 'This is a second test', time: time)
      Peep.create(text: 'This is a third test', time: time)

      expect(Peep.all).to include 'This is a test peep made on 2002-02-02 00:00:00'
      expect(Peep.all).to include 'This is a second test made on 2002-02-02 00:00:00'
      expect(Peep.all).to include 'This is a third test made on 2002-02-02 00:00:00'
    end 

    it "returns Peeps in reverse chronological order" do 
      Peep.create(text: "This is the first (earlier) peep", time: Time.new(2020,02,02))
      Peep.create(text: "This is the second (later) peep", time: Time.new(2020,03,03))

      expect(Peep.all.first).to eq("This is the second (later) peep made on 2020-03-03 00:00:00")
    end
  end 

  describe '.create' do 
    it 'creates a new peep post' do 
      time = Time.new(2002, 02, 02)
      
      Peep.create(text: 'This is a new test peep', time: time)

      expect(Peep.all).to include 'This is a new test peep made on 2002-02-02 00:00:00'
    end 
  end 
end 
