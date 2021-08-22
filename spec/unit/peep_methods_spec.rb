require 'peep'

describe Peep do

  it { should respond_to(:id) }
  it { should respond_to(:message) }

  describe '#create' do
    it 'creates a new peep' do
      peep = Peep.create("Im a brand new peep")
      expect(peep).to be_a(Peep)
      expect(peep.message).to eq("Im a brand new peep")
    end
  end

  describe '#all_peeps' do
    it 'lists all the peeps' do
      all_peeps = Peep.all_peeps
      expect(all_peeps).to include(Peep)
      expect(all_peeps.length).to eq(2)
      expect(all_peeps.first.message).to eq('Im a peep!')
    end
  end

  describe '#newest_peeps' do
    it 'should list peeps in chronological order' do
      new_peep = Peep.create("peep!")
      newest_peeps_first = Peep.newest_peeps
      expect(newest_peeps_first[0].message).to eq(new_peep.message)
    end
  end

end
