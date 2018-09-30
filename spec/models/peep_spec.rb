describe Peep do
  
  describe '.all' do
    it 'returns all peeps in reverse order' do

      # connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      now = DateTime.now
      Peep.create(peep: 'first peep', time: (now - 2).to_s)
      Peep.create(peep: 'second peep',time: (now - 1).to_s)
      Peep.create(peep: 'third peep',time: (now).to_s)

      peeps = Peep.all
      peep = peeps.first
      
      expect(peeps.length).to eq 3
      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep.peep_text).to eq 'third peep'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      now = Time.now
      peep = Peep.create(peep: 'Test time peep', time: now)
      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep.peep_text).to eq 'Test time peep'
      expect(peep.time.strftime("%Y-%m-%d %H:%M:%S%z")).to eq now.strftime("%Y-%m-%d %H:%M:%S%z")
    end
  end
end