require 'peep'

describe Peep do
    # class methods
  # stores a list of peeps - see bookmark.all
  # can add a peep to the database - see bookmark.create

  describe '.create' do
    it 'adds a peep to the database' do
      peep = Peep.create(content: "This is a peep")

      expect(peep.content).to eq "This is a peep"
    end

    # it 'records the time a peep was created' do
      
    # end

    # it 'will not add a peep if more than 144 characters' do
      
    # end
  end

  # instance methods
  # stores the id number
  # stores the content
  # stores user id
end
