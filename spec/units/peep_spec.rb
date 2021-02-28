require 'peep'

describe Peep do
    # class methods
  # stores a list of peeps - see bookmark.all
  let(:frozen_time) { Time.now.strftime("%Y-%m-%d %H:%M:%S") }

  before(:each) do
    Timecop.travel(frozen_time)
  end

  after(:each) do
    Timecop.return
  end

  describe '.create' do
    it 'adds a peep to the database' do
      peep = Peep.create(content: "This is a peep", created_at: frozen_time)

      expect(peep.content).to eq "This is a peep"
    end

    it 'records the time a peep was created' do
      peep = Peep.create(content: "This is a peep", created_at: frozen_time)

      expect(peep.created_at).to eq frozen_time
    end

    # it 'will not add a peep if more than 144 characters' do
      
    # end
  end

  # instance methods
  # stores the id number
  # stores the content
  # stores user id
end
