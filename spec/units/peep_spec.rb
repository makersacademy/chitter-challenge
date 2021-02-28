require 'peep'

describe Peep do
    # class methods
  # stores a list of peeps - see bookmark.all
  let(:frozen_time) { Time.now.strftime("%Y-%m-%d %H:%M:%S") }

  subject(:peep_1) { Peep.create(content: "This is a peep", created_at: frozen_time) }
  subject(:peep_2) { Peep.create(content: "This is also a peep", created_at: frozen_time) }
  subject(:peep_3) { Peep.create(content: "This too is a peep", created_at: frozen_time) }

  before(:each) do
    Timecop.travel(frozen_time)
  end

  after(:each) do
    Timecop.return
  end

  describe '.all' do
    it 'stores a list of peeps' do
      peep = peep_1
      peep_2
      peep_3

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq "This is a peep"
      expect(peeps.first.created_at).to eq frozen_time
      expect(peeps.last.content).to eq "This too is a peep"
    end
  end

  describe '.create' do
    it 'adds a peep to the database' do
      expect(peep_1.content).to eq "This is a peep"
    end

    it 'records the time a peep was created' do
      expect(peep_1.created_at).to eq frozen_time
    end

    # it 'will not add a peep if more than 144 characters' do
      
    # end
  end
end
