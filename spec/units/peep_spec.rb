require 'peep'

describe Peep do
  let(:time_1) { (Time.local(2020, 2, 28, 18, 45, 0)).strftime("%Y-%m-%d %H:%M:%S") }
  let(:time_2) { (Time.local(2020, 2, 28, 18, 46, 0)).strftime("%Y-%m-%d %H:%M:%S") }
  let(:time_3) { (Time.local(2020, 2, 28, 18, 47, 0)).strftime("%Y-%m-%d %H:%M:%S") }

  subject(:peep_1) { Peep.create(content: "This is a peep", created_at: time_1) }
  subject(:peep_2) { Peep.create(content: "This is also a peep", created_at: time_2) }
  subject(:peep_3) { Peep.create(content: "This too is a peep", created_at: time_3) }

  describe '.all' do
    it 'stores a list of peeps' do
      peep = peep_1
      peep_2
      peep_3

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.content).to eq "This is a peep"
      expect(peeps.last.created_at).to eq time_1
      expect(peeps.first.content).to eq "This too is a peep"
    end
  end

  describe '.create' do
    it 'adds a peep to the database' do
      expect(peep_1.content).to eq "This is a peep"
    end

    it 'records the time a peep was created' do
      expect(peep_1.created_at).to eq time_1
    end

    # it 'will not add a peep if more than 144 characters' do
      
    # end
  end
end
