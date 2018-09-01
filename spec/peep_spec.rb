describe Peep do

  describe '.create' do
    it 'saves a new peep to the database' do
      peep = Peep.create('This is a test')
      expect(peep).to be_a Peep
      expect(peep.text).to eq 'This is a test'
    end

    it 'saves the time when the peep was posted' do
      peep = Peep.create('This is a test')
      formatted_time = Time.now.strftime("%I:%M%p on %m/%d/%Y")
      expect(peep.time).to eq formatted_time
    end
  end

  describe '.all' do
    it 'returns all the peeps as an array of Peep objects in reverse order' do
      Peep.create('test1')
      Peep.create('test2')
      peeps = Peep.all
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.text).to eq 'test2'
    end
  end

end
