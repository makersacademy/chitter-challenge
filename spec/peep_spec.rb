require 'peep'

describe Peep do
  describe '#all' do
    it 'Returns an array of Peep objects for each peep in the database' do
      peeps = Peep.all
      expect(peeps[0]).to be_a Peep
      expect(peeps[0].message).to eq("Test Peep!")
      expect(peeps[0].created).to eq("Right Now!")
    end
  end
  describe '#add' do
    it 'Adds a peep to the database' do
      allow_any_instance_of(Peep).to receive(:created) { "After Right Now!" }
      Peep.add("Hello World!", 1)
      peeps = Peep.all
      expect(peeps[0]).to be_a Peep
      expect(peeps[0].userID).to eq 1
      expect(peeps[0].message).to eq("Hello World!")
      expect(peeps[0].created).to eq("After Right Now!")
    end
  end

end
